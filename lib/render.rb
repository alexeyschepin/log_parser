# frozen_string_literal: true

# Render log statistics
module Render
  class << self
    def print(page_visits, page_unique_visitors)
      print_page_visits(page_visits)
      puts
      print_page_unique_visitors(page_unique_visitors)
    end

    def print_page_visits(page_visits)
      puts 'list of webpages with most page views ordered from most pages views to less page views'
      page_visits.each { |page, visits| puts "#{page} #{visits} visits" }
    end

    def print_page_unique_visitors(page_unique_visitors)
      puts 'list of webpages with most unique page views also ordered'
      page_unique_visitors.each { |page, visitors| puts "#{page} #{visitors} unique views" }
    end
  end
end
