# frozen_string_literal: true

# Class to group logs by different criteria
class Group
  def initialize(log)
    @log = log
  end

  def by_page
    @log.group_by(&:first).transform_values(&:count).sort_by { |_k, v| -v }
  end

  def by_page_unique_visitors
    groups = @log.group_by(&:first).map do |page, visits|
      unique_visitors = visits.group_by(&:last).count
      [page, unique_visitors]
    end
    groups.sort_by { |_k, v| -v }
  end
end
