Gem::Specification.new do |s|
  s.name        = 'sim'
  s.version     = '0.0.1'
  s.date        = '2014-01-23'
  s.add_runtime_dependency 'system-getifaddrs', '~> 0.2'
  s.add_runtime_dependency 'rspec-rails', '~> 2.0'
  s.add_runtime_dependency 'parallel_tests', '~> 0.16'
  s.add_runtime_dependency 'selenium-webdriver', '~> 2.39'
  s.add_runtime_dependency 'poltergeist', '~> 1.5'
  s.add_runtime_dependency 'cucumber-rails', '~> 1.4'
  s.add_runtime_dependency 'ci_reporter', '~> 1.9'
  s.add_runtime_dependency 'capybara', '~> 2.1'
  s.add_runtime_dependency 'database_cleaner', '~> 1.2'
  s.summary     = "Integrate capybara with jenkins"
  s.description = "Preconfigure rspec and capybara to work with jenkins"
  s.authors     = ["Raybeam"]
  s.email       = 'jfu@raybeam.com'
  s.files       = Dir["lib/**/*"]
  s.files       += Dir["Gemfile"]
  s.files       += Dir["History.md"]
  s.files       += Dir["License.txt"]
  s.files       += Dir["README.md"]
  s.homepage    ='http://rubygems.org/gems/sim'
  s.license     = 'MIT'
end