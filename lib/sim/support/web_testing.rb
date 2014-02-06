puts "loading support/web_testing.rb"

require_relative 'config'
require_relative 'sim_util'
require_relative 'capybara_util'

if is_cucumber
  require_relative 'cucumber_util'
  require 'capybara/cucumber'

  FileUtils.rm_rf($cucumber_base_report_dir)
  FileUtils.mkdir($cucumber_base_report_dir) # cucumber does not auto build directory when capturing screenshot

  After do |scenario|
    # if(scenario.failed?)
      img_name = "#{scenario.__id__}.png"
      path_to_img = File.join($cucumber_base_report_dir,img_name)

      page.save_screenshot(path_to_img)

      self.embed(path_to_img, "image/png", "SCREENSHOT")
    # end
  end
end

if is_rspec
  require_relative 'rspec_util'
  require 'capybara'
  require 'rspec/rails'

  # TESTING SUITE
  FileUtils.rm_rf($base_screenshot_dir)

  RSpec.configure do |config|
    config.include Capybara::RSpecMatchers
    config.include Capybara::DSL
    config.include Rails.application.routes.url_helpers

    # use default driver on all tests
    # config.after do
    #   Capybara.reset_sessions!
    #   Capybara.use_default_driver
    # end

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
end
