#
# Cookbook Name:: geminabox
# Recipe:: default
#
# Copyright (C) 2014 Greg Sherwood
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

# The following recipe will install
# rvm along with required gems
# (see settings in attributes/default.rb
include_recipe 'rvm::system'

# create a group for the geminabox user
group 'geminabox' do
  system true
end

# Create a user 'geminabox'.  We will
# run the service as this user instead of root
user 'geminabox' do
  comment 'Geminabox User'
  system true
  gid 'geminabox'
  shell '/bin/false'
end

# Create a directory for the service config
directory node['geminabox']['conf_dir'] do
  action :create
end

# install the config file starting geminabox
template node['geminabox']['config_file_path'] do
  source 'geminabox_config.ru.erb'
  mode 0644
  owner 'root'
  group 'root'
  variables(
    data_dir: node['geminabox']['data_dir']
  )
end

# install the config file for unicorn
template node['geminabox']['unicorn_config_file_path'] do
  source 'unicorn.conf.erb'
  mode 0644
  owner 'root'
  group 'root'
  variables(
    port: node['geminabox']['port'],
    pid_file_path: node['geminabox']['pid_file_path'],
    log_file_path: node['geminabox']['log_file_path']
  )
end

# directories needed by the geminabox service
# for pidfiles, logs, and data.  These should be
# owned by the geminabox user
geminabox_dirs = node['geminabox']['service_dirs']
geminabox_dirs.each do |dir|
  directory dir do
    owner 'geminabox'
    group 'geminabox'
    action :create
  end
end

template node['geminabox']['init_script_path'] do
  source 'geminabox.erb'
  mode 0755
  owner 'root'
  group 'root'
  variables(
    conf_dir: node['geminabox']['conf_dir'],
    unicorn_config_file_path: node['geminabox']['unicorn_config_file_path'],
    pid_file_path: node['geminabox']['pid_file_path']
  )
end

# enable the geminabox service
service 'geminabox' do
  action [:enable, :start]
end

# get the napa gem from the git repo
git "#{Chef::Config[:file_cache_path]}/napa-build" do
  repository node['geminabox']['napa_git_repo_url']
  reference 'master'
  action :sync
  notifies :run, 'bash[install_napa]', :immediately
end

# Build the napa gem from the gemspec and upload to geminabox
bash 'install_napa' do
  cwd "#{Chef::Config[:file_cache_path]}/napa-build"
  code <<-EOF
    # use rvm to set up the shell environment correctly
    . $(/usr/local/rvm/bin/rvm 1.9.3-p484 do rvm env --path)
    gem build napa.gemspec
    gemfile=`ls napa*.gem`; gem inabox $gemfile -g \
             http://127.0.0.1:#{node['geminabox']['port']} -o
  EOF
  action :nothing
end
