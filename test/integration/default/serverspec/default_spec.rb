require 'spec_helper'

describe group('geminabox') do
  it { should exist }
end

describe user('geminabox') do
  it { should exist }
  it { should belong_to_group 'geminabox' }
  it { should have_login_shell '/bin/false' }
end

describe service('geminabox') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8080) do
  it { should be_listening.with('tcp') }
end

describe command('. $(/usr/local/rvm/bin/rvm 1.9.3-p484 do rvm env --path); gem list -r --clear-sources --source http://127.0.0.1:8080 | grep napa') do
  it { should return_stdout(/napa/) }
end
