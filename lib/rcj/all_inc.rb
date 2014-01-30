Dir['./config/environment.rb'].map {|f| require f}

require 'rcj/support/config'
require 'rcj/support/utilities'
require 'rcj/support/database_cleaner'
require 'rcj/support/web_testing'