# frozen_string_literal: true

module LeetCode
  # 287. Find the Duplicate Number
  module LC287
    # Description:
    # Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
    # There is only one repeated number in nums, return this repeated number.
    #
    # You must solve the problem without modifying the array nums and uses only constant extra space.
    #
    # Follow up:
    # - How can we prove that at least one duplicate number must exist in nums?
    # - Can you solve the problem in linear runtime complexity?
    #
    # Examples:
    # Input: nums = [1, 3, 4, 2, 2]
    # Output: 2
    #
    # Input: nums = [3, 1, 3, 4, 2]
    # Output: 3
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def find_duplicate(nums)
      lo = 1
      hi = nums.length - 1

      dup = nil

      while lo <= hi
        mid = ((hi - lo) / 2) + lo

        if nums.count { |num| num <= mid } > mid
          dup = mid
          hi = mid - 1
        else
          lo = mid + 1
        end
      end

      dup
    end
  end
end
