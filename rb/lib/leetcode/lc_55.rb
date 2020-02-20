# typed: true
# frozen_string_literal: true

module LeetCode
  # 55. Jump Game
  module LC55
    # Description:
    # Given an array of non-negative integers, you are initially positioned at the first index of the array.
    # Each element in the array represents your maximum jump length at that position.
    # Determine if you are able to reach the last index.
    #
    # Examples:
    # - 1:
    #   Input: [2, 3, 1, 1, 4]
    #   Output: true
    #
    # - 2:
    #   Input: [3, 2, 1, 0, 4]
    #   Output: false
    #
    # @param list {Array<Integer>}
    # @return {Boolean}
    def can_jump(list)
      nearest = list.length - 1

      result = list.reverse_each.map.with_index do |v, i|
        next true if i.zero?

        i = (list.length - 1) - i
        if v + i >= nearest
          nearest = i
          next true
        end

        false
      end

      result[result.length - 1]
    end
  end
end
