# frozen_string_literal: true

require 'kafka'
require 'bunny'
require 'dotenv'
require 'simple_command'

require_relative 'generate_number'

ENV['ENVIRONMENT'] ||= 'development'

Dotenv.load(".env.#{ENV.fetch('ENVIRONMENT')}.local", ".env.#{ENV.fetch('ENVIRONMENT')}", '.env')

GenerateNumber.call