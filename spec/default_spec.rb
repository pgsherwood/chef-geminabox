require 'chefspec'  
require_relative 'spec_helper'

describe 'geminabox::default' do  
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the apt recipe' do
    expect(chef_run).to include_recipe('apt')
  end  

end