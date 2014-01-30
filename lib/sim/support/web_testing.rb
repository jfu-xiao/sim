require_relative 'utilities'

puts "loading support/web_testing.rb"

require 'capybara'
require 'rspec/rails'

RSpec.configure do |config|
  config.include Capybara::RSpecMatchers
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers

  # use default driver on all tests
  # config.after do
  #   Capybara.reset_sessions!
  #   Capybara.use_default_driver
  # end

  # TESTING SUITE
  FileUtils.rm_rf($base_screenshot_dir)

  config.before(:each) do
    # don't test model
    if example.metadata[:type] != :model
      example.metadata[:id] = @example_number
      example.metadata[:snapshot_count] = '000'
      FileUtils.mkdir_p(path_to_tmp(example)) unless File.exists?(path_to_tmp(example))
    end
  end

  config.after(:each) do
    # don't test model
    if example.metadata[:type] != :model
      result_name = example.exception ? "failure" : "final"

      save_snapshot(example,result_name)
    end
  end
  # END TESTING SUITE
end
