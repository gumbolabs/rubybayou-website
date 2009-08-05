# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rubybayou.com_session',
  :secret      => 'c152117d2379610fe506d7262a5edfba07cf32f9b5d4c366073049b653f6c7fc31f9f2a91aad0aba77ced3933129cb81d4825f3d30221fe0c6f8b5a6cf995762'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
