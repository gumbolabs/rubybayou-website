# Ramaze Cucumber
require 'ramaze'
require 'ramaze/spec/bacon'
require File.join(File.dirname(__FILE__), *%w[.. .. app.rb])

include Rack::Test::Methods

def app
  Ramaze.middleware
end