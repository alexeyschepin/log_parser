#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/app'

file = ARGV.first
app = App.new(file)
app.run
