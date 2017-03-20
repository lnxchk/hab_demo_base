#
# Cookbook:: tmi_demo
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
#

# fire up docker
docker_service 'default' do
  action [:create, :start]
end

# need docker-compose
remote_file '/usr/local/bin/docker-compose' do
  source 'https://github.com/docker/compose/releases/download/1.11.2/docker-compose-Linux-x86_64'
  mode '0755'
  action :create
end

cookbook_file '/home/vagrant/mongo-compose.yml' do
  content 'mongo-compose.yml'
  owner 'vagrant'
  group 'vagrant'
end

group 'docker' do
  append true
  members ['vagrant']
  action :modify
end

# get some habitat
hab_install 'install habitat'

user 'hab'

