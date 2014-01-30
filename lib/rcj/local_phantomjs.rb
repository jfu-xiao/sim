require_relative 'all_inc.rb'

require 'capybara/rails'

require 'capybara/poltergeist'
# Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist