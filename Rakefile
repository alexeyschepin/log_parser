# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rspec/core/rake_task'

task default: %w[rubocop rspec]

RuboCop::RakeTask.new(:rubocop) do
  puts "\n #{'*' * 10} Rubocop #{'*' * 10}"
end

namespace :rspec do
  desc 'Testing RSpec Unit'
  RSpec::Core::RakeTask.new(:unit) do |task|
    puts "\n #{'*' * 10} Testing RSpec Unit #{'*' * 10}"
    task.rspec_opts = '--pattern "spec/{unit}/**"'
  end

  desc 'Testing RSpec Integration'
  RSpec::Core::RakeTask.new(:integration) do |task|
    puts "\n #{'*' * 10} Testing RSpec Integration #{'*' * 10}"
    task.rspec_opts = '--pattern "spec/{integration}/**"'
  end
rescue LoadError
  # no rspec available
end
task rspec: %w[rspec:unit rspec:integration]
