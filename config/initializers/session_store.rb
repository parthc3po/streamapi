# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_streamapi_session',
  :secret      => 'a28606f67dcaf0e74667d7b7f10d7eabbafdefc79bcf6da4709c77da579787b505e1dd1ed6f815b032d56ea3c065db6793fa9a0b5e1ac20212cda15cc7172d8e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
