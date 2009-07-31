# Setup default database configuration.
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://data.sqlite3')

# Require each individual model.
require 'model/twitter_cache'

# Always make sure our database is up to date.
DataMapper.auto_migrate!