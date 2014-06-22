#
# Cookbook Name:: geminabox
# Recipe:: default
#
# Copyright (C) 2014 Greg Sherwood
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"

# The following recipe will install
# rvm along with required gems 
# (see settings in attributes/default.rb 
include_recipe "rvm::system"
