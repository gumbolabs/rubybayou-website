# Ramaze
app_file = File.join(File.dirname(__FILE__), *%w[.. .. app.rb])
require app_file
 
require 'spec/expectations'
 
require 'webrat'
Webrat.configure do |config|
  config.mode = :rack
end
 
# class MyWorld
#   include Webrat::Methods
#   include Webrat::Matchers
#  
#   Webrat::Methods.delegate_to_session :response_code, :response_body
#  
#   def app
#     Sinatra::Application
#   end
# end
#  
# World{MyWorld.new}