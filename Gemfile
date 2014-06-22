source 'https://rubygems.org'

gem 'berkshelf'

# Uncomment these lines if you want to live on the Edge:
#
# group :development do
#   gem "berkshelf", github: "berkshelf/berkshelf"
#   gem "vagrant", github: "mitchellh/vagrant", tag: "v1.5.2"
# end
#
# group :plugins do
#   gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
#   gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
# end

gem 'thor-foodcritic'
gem 'test-kitchen'
gem 'kitchen-vagrant'
gem 'chefspec', '>=3.1'
gem 'serverspec'
gem 'rubocop'

# ChefSpec dependencies
#
# All gems loaded through the `chef_gem` resource should be included here
# because ChefSpec never really converges these resources and thus the gems are
# never installed during a Chef run. This makes all subsequent `requires` fail.
#
gem 'rvm'
