default['rvm']['default_ruby'] = 'ruby-1.9.3-p484'
default['rvm']['global_gems'] = [{ 'name' => 'unicorn' },
                                 { 'name' => 'geminabox' }]

default['geminabox']['conf_dir'] = '/etc/geminabox'
default['geminabox']['config_file_path'] =
  default['geminabox']['conf_dir'] + '/config.ru'
default['geminabox']['unicorn_config_file_path'] =
  default['geminabox']['conf_dir'] + '/unicorn.rb'
default['geminabox']['data_dir'] = '/var/geminabox-data'
default['geminabox']['pid_dir'] = '/var/run/geminabox'
default['geminabox']['log_dir'] = '/var/log/geminabox'
default['geminabox']['port'] = '8080'
default['geminabox']['pid_file_path'] =
  default['geminabox']['pid_dir'] + '/unicorn.pid'
default['geminabox']['log_file_path'] =
  default['geminabox']['log_dir'] + '/unicorn.log'
default['geminabox']['init_script_path'] = '/etc/init.d/geminabox'

default['geminabox']['service_dirs'] = [default['geminabox']['data_dir'],
                                        default['geminabox']['pid_dir'],
                                        default['geminabox']['log_dir']]
default['geminabox']['napa_git_repo_url'] =
  'https://github.com/bellycard/napa.git'
