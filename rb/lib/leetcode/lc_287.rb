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
      result = private_methods.grep(/^find_duplicate_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_duplicate_1(nums)
      lo = 1
      hi = nums.length - 1

      result = nil

      while lo <= hi
        mid = ((hi - lo) / 2) + lo

        case mid <=> nums.count { |num| num <= mid }
        when -1
          result = mid
          hi = mid - 1
        when 0, 1
          lo = mid + 1
        end
      end

      result
    end

    def find_duplicate_2(nums)
      i = nums[0]
      j = nums[0]

      loop {
        i = nums[i]
        j = nums[nums[j]]
        break if i == j
      }

      i = nums[0]

      while i != j
        i = nums[i]
        j = nums[j]
      end

      j
    end
  end
end
