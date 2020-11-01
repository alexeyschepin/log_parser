# frozen_string_literal: true

require 'rspec'
require 'tempfile'
require_relative '../lib/app'

if ENV['COVERAGE'] == 'true'
  begin
    require 'simplecov'
    require 'simplecov-console'
    SimpleCov.formatter = SimpleCov::Formatter::Console
    SimpleCov.start
  rescue LoadError
    abort 'Coverage driver not available. In order to run coverage, you must run: gem install simplecov'
  end
end

RSpec.configure do |config|
  config.order = 'random'
end
