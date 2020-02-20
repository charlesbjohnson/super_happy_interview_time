# typed: false
# frozen_string_literal: true

module LeetCode
  # 56. Merge Intervals
  module LC56
    Interval = Struct.new(:start, :end)

    # Description:
    # Given a collection of intervals, merge all overlapping intervals.
    #
    # Examples:
    # Input: [[1, 3], [2, 6], [8, 10], [15, 18]]
    # Output: [[1,6], [8, 10], [15, 18]]
    #
    # @param intervals {Array<Interval>}
    # @return {Array<Interval>}
    def merge(intervals)
      merged = []

      left = nil
      right = nil

      intervals.sort_by! { |interval| [interval.start, interval.end] }

      until intervals.empty?
        left = intervals.shift
        right = intervals.shift

        unless right
          merged.push(left)
          next
        end

        if left.start <= right.start && left.end >= right.end
          intervals.unshift(left)
          next
        end

        if left.start == right.start && left.end < right.end
          intervals.unshift(right)
          next
        end

        if left.end >= right.start
          intervals.unshift(Interval.new(left.start, right.end))
          next
        end

        merged.push(left)
        intervals.unshift(right)
      end

      merged
    end
  end
end
