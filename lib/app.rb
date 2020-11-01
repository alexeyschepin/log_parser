# frozen_string_literal: true

require_relative 'group'
require_relative 'log_parser'
require_relative 'render'

# Application to process website logs and print statistics
class App
  def initialize(file)
    @file = file
  end

  def run
    raise ArgumentError, 'file is missing' unless @file

    logs = LogParser.perform(@file)
    group = Group.new(logs)
    Render.print(group.by_page, group.by_page_unique_visitors)
  end
end
