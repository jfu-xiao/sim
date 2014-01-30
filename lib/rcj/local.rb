require_relative 'all_inc.rb'

require_relative 'support/config'
require 'capybara/rails'

puts "loading local.rb"

# Capybara local run
Capybara.javascript_driver = :selenium
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end