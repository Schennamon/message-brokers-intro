# frozen_string_literal: true

require 'dotenv'
require 'redis'
require 'simple_command'

require_relative 'generate_number'

ENV['ENVIRONMENT'] ||= 'development'

Dotenv.load(".env.#{ENV.fetch('ENVIRONMENT')}.local", ".env.#{ENV.fetch('ENVIRONMENT')}", '.env')

GenerateNumber.call
