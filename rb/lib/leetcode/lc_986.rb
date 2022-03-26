# frozen_string_literal: true

module LeetCode
  # 986. Interval List Intersections
  module LC986
    TreeMap = Helpers::LeetCode::TreeMap

    # Description:
    # You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [starti, endi] and secondList[j] = [startj, endj].
    # Each list of intervals is pairwise disjoint and in sorted order.
    #
    # Return the intersection of these two interval lists.
    #
    # A closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.
    #
    # The intersection of two closed intervals is a set of real numbers that are either empty or represented as a closed interval.
    # For example, the intersection of [1, 3] and [2, 4] is [2, 3].
    #
    # Examples:
    # Input: firstList = [[0, 2], [5, 10], [13, 23], [24, 25]], secondList = [[1, 5], [8, 12], [15, 24], [25, 26]]
    # Output: [[1, 2], [5, 5], [8, 10], [15, 23], [24, 24], [25, 25]]
    #
    # Input: firstList = [[1, 3], [5, 9]], secondList = []
    # Output: []
    #
    # @param {Array<Array<(Integer, Integer)>>} first_list
    # @param {Array<Array<(Integer, Integer)>>} second_list
    # @return {Array<Array<(Integer, Integer)>>}
    def interval_intersection(first_list, second_list)
      result = private_methods.grep(/^interval_intersection_\d+$/).map { |m| send(m, first_list, second_list) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def interval_intersection_1(first_list, second_list)
      return [] if first_list.empty? || second_list.empty?

      events = TreeMap.new { |h, k| h[k] = [0, 0] }

      first_list.each { |i, j|
        events[i][0] += 1
        events[j][1] += -1
      }

      second_list.each { |i, j|
        events[i][0] += 1
        events[j][1] += -1
      }

      result = []

      merge = [nil, nil]
      count = 0

      events.each { |i, event|
        merge[0] = i if count != 2 && count + event[0] == 2
        count += event[0]

        merge[1] = i if count == 2 && count + event[1] != 2
        count += event[1]

        if merge[0] && merge[1]
          result.push(merge)
          merge = [nil, nil]
        end
      }

      result
    end

    def interval_intersection_2(first_list, second_list)
      result = []

      i = 0
      j = 0

      while i < first_list.length && j < second_list.length
        interval_i = first_list[i]
        interval_j = second_list[j]

        l = [interval_i[0], interval_j[0]].max
        r = [interval_i[1], interval_j[1]].min

        result.push([l, r]) if l <= r

        case interval_i[1] <=> interval_j[1]
        when -1
          i += 1
        when 0, 1
          j += 1
        end
      end

      result
    end
  end
end
