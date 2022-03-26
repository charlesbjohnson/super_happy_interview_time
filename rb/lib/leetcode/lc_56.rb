# frozen_string_literal: true

module LeetCode
  # 56. Merge Intervals
  module LC56
    TreeMap = Helpers::LeetCode::TreeMap

    # Description:
    # Given an array of intervals where intervals[i] = [starti, endi],
    # merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
    #
    # Examples:
    # Input: intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
    # Output: [[1, 6], [8, 10], [15, 18]]
    #
    # Input: intervals = [[1, 4], [4, 5]]
    # Output: [[1, 5]]
    #
    # @param {Array<Array<(Integer, Integer)>>} intervals
    # @return {Array<Array<(Integer, Integer)>>}
    def merge(intervals)
      result = private_methods.grep(/^merge_\d+$/).map { |m| send(m, intervals.clone) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def merge_1(intervals)
      result = []

      events = intervals.each_with_object(TreeMap.new(0)) { |(i, j), m|
        m[i] += 1
        m[j] -= 1
      }

      merge = [nil, nil]
      count = 0

      events.sort.each { |k, v|
        merge[0] = k if count == 0
        count += v
        merge[1] = k if count == 0

        if merge[0] && merge[1]
          result.push(merge)
          merge = [nil, nil]
        end
      }

      result
    end

    def merge_2(intervals)
      intervals.sort!

      result = [intervals[0]]

      (1...intervals.length).each { |i|
        merge = result[-1]
        interval = intervals[i]

        if merge[1] >= interval[0]
          merge[1] = [merge[1], interval[1]].max
        else
          result.push(interval)
        end
      }

      result
    end
  end
end
