# frozen_string_literal: true

# Class to group logs by different criteria
class Group
  def initialize(log)
    @log = log
  end

  def by_page
    @log.group_by(&:first).transform_values(&:count)
  end

  def by_page_unique_visitors
    @log.group_by(&:first).map do |page, visits|
      unique_visitors = visits.group_by(&:last).count
      [page, unique_visitors]
    end.to_h
  end
end
