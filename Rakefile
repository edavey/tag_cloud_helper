require 'rake'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Generate documentation for the tag_cloud_helper plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'TagCloudHelper'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
