# frozen_string_literal: true

module LeetCode
  # 252. Meeting Rooms
  module LC252
    # Description:
    # Given an array of meeting time intervals where intervals[i] = [starti, endi],
    # determine if a person could attend all meetings.
    #
    # Examples:
    # Input: intervals = [[0, 30], [5, 10], [15, 20]]
    # Output: false
    #
    # Input: intervals = [[7, 10], [2, 4]]
    # Output: true
    #
    # @param {Array<Array<(Integer, Integer)>>} intervals
    # @return {Boolean}
    def can_attend_meetings(intervals)
      intervals.sort!

      (0...(intervals.length - 1)).each { |i|
        return false if intervals[i][1] > intervals[i + 1][0]
      }

      true
    end
  end
end
