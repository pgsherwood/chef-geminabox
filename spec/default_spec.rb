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

end