require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "shoulda-spike"
  gem.homepage = "http://github.com/augusto/shoulda-spike"
  gem.license = "MIT"
  gem.summary = %Q{TODO: one-line summary of your gem}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "augusto.rodriguez@gmail.com"
  gem.authors = ["Augusto Rodriguez"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end


namespace :cover_me do
  require 'cover_me'
  CoverMe.config do |c|
      # where is your project's root:
      c.project.root = Dir.getwd

      # what files are you interested in coverage for:
      c.file_pattern = /(#{CoverMe.config.project.root}\/test\/test.+\.rb)/i 

      # where do you want the HTML generated:
      c.html_formatter.output_path = File.join(CoverMe.config.project.root, 'coverage') 

      # what do you want to happen when it finishes:
      # c.at_exit = Proc.new {
      #   if CoverMe.config.formatter == CoverMe::HtmlFormatter
      #     index = File.join(CoverMe.config.html_formatter.output_path, 'index.html')
      #     if File.exists?(index)
      #       `open #{index}`
      #     end
      #   end
      # } 
  end
  
  task :report do
    CoverMe.complete!
  end
  
end

task :test do
  Rake::Task['cover_me:report'].invoke
end

task :spec do
  Rake::Task['cover_me:report'].invoke
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "shoulda-spike #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
