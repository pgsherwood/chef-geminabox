require 'chefspec'
require_relative 'spec_helper'

describe 'geminabox::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before do
    stub_command("bash -c \"source /etc/profile && type rvm | cat | head -1 | grep -q '^rvm is a function$'\"").and_return(false)
  end

  it 'includes the apt recipe' do
    expect(chef_run).to include_recipe('apt')
  end

  it 'includes the rvm::system recipe' do
    expect(chef_run).to include_recipe('rvm::system')
  end

  it 'creates a geminabox group' do
    expect(chef_run).to create_group('geminabox').with(
      system: true
    )
  end

  it 'creates a geminabox user' do
    expect(chef_run).to create_user('geminabox').with(
      system: true,
      comment: 'Geminabox User',
      gid: 'geminabox',
      shell: '/bin/false'
    )
  end

  it 'creates config directory' do
    expect(chef_run).to create_directory('/etc/geminabox')
  end

  it 'creates geminabox config file' do
    expect(chef_run).to create_template('/etc/geminabox/config.ru')
  end

  it 'creates unicorn config file' do
    expect(chef_run).to create_template('/etc/geminabox/unicorn.rb')
  end

  it 'creates geminabox pid directory' do
    expect(chef_run).to create_directory('/var/run/geminabox').with(
      owner: 'geminabox',
      group: 'geminabox'
    )
  end

  it 'creates geminabox log directory' do
    expect(chef_run).to create_directory('/var/log/geminabox').with(
      owner: 'geminabox',
      group: 'geminabox'
    )
  end

  it 'creates geminabox data directory' do
    expect(chef_run).to create_directory('/var/geminabox-data').with(
      owner: 'geminabox',
      group: 'geminabox'
    )
  end

  it 'creates the geminabox init script' do
    expect(chef_run).to create_template('/etc/init.d/geminabox').with(
      owner: 'root',
      group: 'root',
      mode: 0755
    )
  end

  it 'enables and starts the geminabox service' do
    expect(chef_run).to enable_service('geminabox')
    expect(chef_run).to start_service('geminabox')
  end

  it 'gets the Napa gem from its git repo' do
    expect(chef_run).to sync_git('/var/chef/cache/napa-build').with(
      repository: 'https://github.com/bellycard/napa.git'
    )
  end

end
