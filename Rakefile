require 'rake'
require 'rspec/core/rake_task'
require 'rubygems'
require 'yaml'
require 'highline/import'


if not ENV["RESULT_PATH"]
  raise 'Provide output location to store result  using env variable RESULT_PATH'
end

output_path = ENV["RESULT_PATH"]
host = ENV["SERVERSPEC_IP"]
roles = ["base"]

desc "Run serverspec test on all provided hosts"
task :spec => 'serverspec:all'
status = 0

namespace :serverspec do
  task :all do

    #hosts = properties.hosts

    #properties.hosts.each do |host|
      #roles = properties[host][:roles]
      desc "Running serverspec test on #{host} for roles #{roles}"
      puts "Running serverspec test on #{host} for roles #{roles}"
      roles.each do |role|
        puts "Running role #{role} on host #{host}"
        RSpec::Core::RakeTask.new("#{role}-#{host}") do |t|
          ENV['TARGET_HOST'] = host
          t.pattern = 'spec/{' + role + '}/*_spec.rb'
	  t.rspec_opts = "--format documentation --format html --out #{output_path}/#{host}-ss.html --format documentation --format json --out #{output_path}/#{host}-ss.json"
        end
        begin
          Rake::Task["#{role}-#{host}"].execute
          puts "Serverspec test on host #{host} SUCCESS for role #{role}"
        rescue Exception => e
          puts "Serverspec test on host #{host} FAILED for role #{role} with error #{e}"
          status = status + 1
        end
      end
    #end
    exit status
  end
end

