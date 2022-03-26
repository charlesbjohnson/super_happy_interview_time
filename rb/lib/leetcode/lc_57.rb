# frozen_string_literal: true

module LeetCode
  # 57. Insert Interval
  module LC57
    # Description:
    # You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti.
    # You are also given an interval newInterval = [start, end] that represents the start and end of another interval.
    #
    # Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).
    #
    # Return intervals after the insertion.
    #
    # Examples:
    # Input: intervals = [[1, 3], [6, 9]], newInterval = [2, 5]
    # Output: [[1, 5], [6, 9]]
    #
    # Input: intervals = [[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], newInterval = [4, 8]
    # Output: [[1, 2], [3, 10], [12, 16]]
    #
    # @param {Array<Array<(Integer, Integer)>>} intervals
    # @param {Array<(Integer, Integer)>} new_interval
    # @return {Array<Array<(Integer, Integer)>>}
    def insert(intervals, new_interval)
      overlap = ->(a, b) { [a[0], b[0]].max <= [a[1], b[1]].min }

      result = []
      i = 0

      while i < intervals.length && !overlap.call(intervals[i], new_interval) && intervals[i][0] < new_interval[0]
        result.push(intervals[i])
        i += 1
      end

      while i < intervals.length && overlap.call(intervals[i], new_interval)
        new_interval = [[new_interval[0], intervals[i][0]].min, [new_interval[1], intervals[i][1]].max]
        i += 1
      end

      result.push(new_interval)

      while i < intervals.length
        result.push(intervals[i])
        i += 1
      end

      result
    end
  end
end
