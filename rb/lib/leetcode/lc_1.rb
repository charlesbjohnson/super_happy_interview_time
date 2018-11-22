# frozen_string_literal: true

module LeetCode
  # 1. Two Sum
  module LC1
    # Description:
    # Given an array of integers, return indices of the two numbers such that they add up to a specific target.
    #
    # You may assume that each input would have exactly one solution,
    # and you may not use the same element twice.
    #
    # Examples:
    # Input: list = [2, 7, 11, 15], target = 9
    # Output: [0, 1]
    #
    # @param list {Array<Integer>}
    # @param target {Integer}
    # @return {Array<Integer>}
    def two_sum(list, target)
      list = list
             .map.with_index { |n, i| [n, i] }
             .sort_by { |(n, _)| n }

      left = 0
      right = list.length - 1

      while left < right
        sum = list[left].first + list[right].first

        return [list[left].last, list[right].last] if sum == target

        if sum < target
          left += 1
        else
          right -= 1
        end
      end

      []
    end
  end
end
