puts "loading support/remote.rb"

require_relative 'all_inc.rb'
require_relative 'support/config'
require 'selenium-webdriver'
require 'rspec/rails'
require 'capybara/rails'

def set_app_address()
    require 'system/getifaddrs'
    ip = $webserver_ip != nil ? $webserver_ip : System.get_ifaddrs.find{ |socket| socket[1][:inet_addr] != "127.0.0.1" } [1][:inet_addr]
    port = $webserver_port != nil ? $webserver_port : Capybara.current_session.server.port
    Capybara.app_host = "http://#{ip}:#{port}"
    puts "Registering http://#{ip}:#{port} as root server"
end

Capybara.javascript_driver = :selenium_chrome
Capybara.default_driver = :selenium_phantomjs

# Capybara remote run
# # init ip
caps = Selenium::WebDriver::Remote::Capabilities.chrome
# caps.version = "8"
caps.platform = :WINDOWS

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    :browser => :remote,
    :url => "http://#{$grid_host}:#{$grid_port}/wd/hub",
    :desired_capabilities => caps
    )
end

# Capybara remote run phantomjs
# # init ip
caps_phantomjs = Selenium::WebDriver::Remote::Capabilities.phantomjs
# caps.version = "8"
# caps_phantomjs.platform = :WINDOWS

Capybara.register_driver :selenium_phantomjs do |app|
  Capybara::Selenium::Driver.new(
    app,
    :browser => :remote,
    :url => "http://#{$grid_host}:#{$grid_port}/wd/hub",
    :desired_capabilities => caps_phantomjs
    )
end

if is_cucumber()
  puts "yes"
  Before do |scenario|
    set_app_address()
  end
end

if is_rspec()
  puts "no"
  RSpec.configure do |config|
    config.include Capybara::DSL

    # this allows each test to use the proper port when using
    # Capybara's "random available port"
    config.before(:each) do
      next if Capybara.current_session.server.nil?

      set_app_address()
    end
  end
end


