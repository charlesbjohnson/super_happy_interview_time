# frozen_string_literal: true

module LeetCode
  # 217. Contains Duplicate
  module LC217
    # Description:
    # Given an integer array nums, return true if any value appears at least twice in the array,
    # and return false if every element is distinct.
    #
    # Examples:
    # Input: nums = [1, 2, 3, 1]
    # Output: true
    #
    # Input: nums = [1, 2, 3, 4]
    # Output: false
    #
    # Input: nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
    # Output: true
    #
    # @param {Array<Integer>} nums
    # @return {Boolean}
    def contains_duplicate(nums)
      set = Set.new

      nums.each { |num|
        return true unless set.add?(num)
      }

      false
    end
  end
end
