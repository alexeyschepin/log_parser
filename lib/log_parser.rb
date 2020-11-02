# frozen_string_literal: true

# Module to parse log files
# in format where page and visitor id are split by space
# e.g.
# /help_page/1 126.318.035.038
# /contact 184.123.665.067
module LogParser
  class << self
    def perform(file)
      File.readlines(file).map { |l| l.split(' ') }
    end
  end
end
