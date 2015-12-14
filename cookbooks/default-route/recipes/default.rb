#
# Cookbook Name:: default-route
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

route "0.0.0.0/0" do
  gateway node['route']['ip_gateway']
  device node['route']['device']
end
