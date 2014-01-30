Dir['./config/environment.rb'].map {|f| require f}

require 'sim/support/config'
require 'sim/support/utilities'
require 'sim/support/database_cleaner'
require 'sim/support/web_testing'