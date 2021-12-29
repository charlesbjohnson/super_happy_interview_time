# frozen_string_literal: true

module LeetCode
  # 448. Find All Numbers Disappeared in an Array
  module LC448
    # Description:
    #
    # Given an array nums of n integers where nums[i] is in the range [1, n],
    # return an array of all the integers in the range [1, n] that do not appear in nums.
    #
    # Follow up: Could you do it without extra space and in O(n) runtime?
    # You may assume the returned list does not count as extra space.
    #
    # Examples:
    # Input: [4, 3, 2, 7, 8, 2, 3, 1]
    # Output: [5, 6]
    #
    # Input: nums = [1,1]
    # Output: [2]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Integer>}
    def find_disappeared_numbers(nums)
      i = 0

      while i < nums.length
        if !nums[i] || nums[i] == i + 1
          i += 1
          next
        end

        j = nums[i] - 1
        if nums[i] == nums[j]
          nums[i] = nil
          i += 1
          next
        end

        tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
      end

      nums.each_with_object([]).with_index { |(num, missing), i|
        missing.push(i + 1) if num.nil?
      }
    end
  end
end
