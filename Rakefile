#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SiSINTA::Application.load_tasks

# Agrega test:routes al test suite default
Rails::TestTask.new('test:routes' => 'test:prepare') do |t|
  t.pattern = 'test/routes/**/*_test.rb'
end
Rake::Task['test:run'].enhance ['test:routes']
