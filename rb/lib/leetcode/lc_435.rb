# frozen_string_literal: true

module LeetCode
  # 435. Non-overlapping Intervals
  module LC435
    # Description:
    # Given an array of intervals intervals where intervals[i] = [starti, endi],
    # return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.
    #
    # Examples:
    # Input: intervals = [[1, 2], [2, 3], [3, 4], [1, 3]]
    # Output: 1
    #
    # Input: intervals = [[1, 2], [1, 2], [1, 2]]
    # Output: 2
    #
    # Input: intervals = [[1, 2], [2, 3]]
    # Output: 0
    #
    # @param {Array<Array<(Integer, Integer)>>} intervals
    # @return {Integer}
    def erase_overlap_intervals(intervals)
      intervals.sort!

      result = 0

      i = 0
      j = 1

      while j < intervals.length
        if intervals[i][1] > intervals[j][0]
          result += 1

          if intervals[i][1] <= intervals[j][1]
            j += 1
            next
          end
        end

        i = j
        j += 1
      end

      result
    end
  end
end
