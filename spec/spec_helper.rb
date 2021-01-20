require 'serverspec'
require 'net/ssh'
require 'yaml'

set :backend, :ssh
set :request_pty, true

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

#properties = YAML.load_file(ENV["HOSTS_FILE"])
hosts = ENV["SERVERSPEC_IP"]

if ENV["SERVERSPEC_USER"]
  options[:user] = ENV["SERVERSPEC_USER"]
else
  raise 'Provide YAML file containing host details using env variable HOSTS_FILE'
end

if ENV['SERVERSPEC_SSH_KEY']
  options[:keys] = [ENV['SERVERSPEC_SSH_KEY']]
elsif ENV['ASK_SSH_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available.Install this package."
  end
  options[:password] = ask("Enter password: ") { |q| q.echo = false }
  options[:auth_methods] =  %w(password)
elsif ENV['SERVERSPEC_PASSWORD']
  options[:password] = ENV['SERVERSPEC_PASSWORD']
  options[:auth_methods] =  %w(password)
else
   raise 'No user password provided.'
end

#Custom SSH Port
if ENV["SERVERSPEC_SSH_PORT"]
  options[:port] = ENV["SERVERSPEC_SSH_PORT"]
end

set :host, options[:host_name] || host
set :ssh_options, options


