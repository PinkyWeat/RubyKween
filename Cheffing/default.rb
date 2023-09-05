#
# Cookbook Name:: salary_calculator
# Recipe:: default
#
# Copyright (c) 2023 The Authors, All Rights Reserved.
#######################################################

# legacy xdxd a
#file 'tmp/myfile.txt' do
#  content 'Hello, Chef'
#  action :create
#end

apt_update 'update' do
  action :update
end

package 'git'
package 'ruby'
package 'ruby-dev'
package 'build-essential'
package 'wget'
package 'unzip'
package 'rsync'

# Making sure the salary calculator setup runs first
include_recipe 'salary_calculator::salary_calc_setup'

execute 'install bundler' do
  command 'gem install bundler'
end

# Bundle install for the Rails application
execute 'bundle install' do
  cwd '/var/www/salary_calculator'
end

# Start the Rails application
execute 'start rails app' do
  command 'rails s -d'
  cwd '/var/www/salary_calculator'
end
