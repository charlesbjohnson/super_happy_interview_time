# frozen_string_literal: true

module LeetCode
  # 253. Meeting Rooms II
  module LC253
    TreeMap = Helpers::LeetCode::TreeMap

    # Description:
    # Given an array of meeting time intervals intervals where intervals[i] = [starti, endi],
    # return the minimum number of conference rooms required.
    #
    # Examples:
    # Input: intervals = [[0, 30], [5, 10], [15, 20]]
    # Output: 2
    #
    # Input: intervals = [[7, 10], [2, 4]]
    # Output: 1
    #
    # @param {Array<Array<(Integer, Integer)>>} intervals
    # @return {Integer}
    def min_meeting_rooms(intervals)
      result = 0

      events = intervals.each_with_object(TreeMap.new(0)) { |(i, j), m|
        m[i] += 1
        m[j] -= 1
      }

      count = 0

      events.each { |i, event|
        count += event
        result = [result, count].max
      }

      result
    end
  end
end
