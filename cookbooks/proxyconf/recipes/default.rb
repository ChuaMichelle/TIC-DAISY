#
# Cookbook Name:: proxyconf
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'enable_daisy' do
  command 'nxensite daisy'
  action :nothing
end

execute 'delete_default' do
  command 'rm /etc/nginx/sites-available/default'
  action :nothing
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
end

template '/etc/nginx/sites-available/daisy' do
  source 'daisy'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :run, 'execute[enable_daisy]', :immediately
  notifies :run, 'execute[delete_default]', :immediately
  notifies :reload, 'service[nginx]', :immediately
end
