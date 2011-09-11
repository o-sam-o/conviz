require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

if ARGV.grep(/rubber:/).empty?
  require File.expand_path('../config/application', __FILE__)

  Convicts::Application.load_tasks
else
  load File.join(File.dirname(__FILE__), 'lib/tasks/rubber.rake')
end
