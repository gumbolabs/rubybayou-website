# This file contains your application, it requires dependencies and necessary
# parts of the application.
#
# It will be required from either `config.ru` or `start.rb`

require 'rubygems'
gem 'ramaze',         '= 2009.07'
gem 'twitter',        '= 0.6.13'
gem 'dm-core',        '= 0.9.11'

require 'ramaze'
require 'twitter'
require 'dm-core'

APP_ROOT = File.dirname(__FILE__)
# Add the directory this file resides in to the load path, so you can run the
# app from any other working directory
$LOAD_PATH.unshift(APP_ROOT)

# Initialize controllers and models
require 'model/init'
require 'controller/init'
