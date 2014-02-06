def is_cucumber()
  respond_to? :After
end

def is_rspec()
  RSpec.respond_to? :configure
end