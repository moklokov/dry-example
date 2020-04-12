# frozen_string_literal: true

require 'bundler'
require 'dotenv'

ENV['APP_ENV'] ||= 'development'

Bundler.setup(:default, ENV['APP_ENV'])

Dotenv.load('.env', ".env.#{ENV['APP_ENV']}")
