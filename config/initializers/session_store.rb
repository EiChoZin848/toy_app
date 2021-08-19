# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_toy_app_session',
  :secret      => '9ad98a4cbf84be86844a2eb0cc70582a14cfb5370e934d05a783f3db3bf149acb8424a25cec8f491508e14a17b513c181f47dce05770faa5e97cc17f1ed25542'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
