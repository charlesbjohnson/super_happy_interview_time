# frozen_string_literal: true

module LeetCode
  # 410. Split Array Largest Sum
  module LC410
    # Description:
    # Given an array nums which consists of non-negative integers and an integer m,
    # you can split the array into m non-empty continuous subarrays.
    #
    # Write an algorithm to minimize the largest sum among these m subarrays.
    #
    # Examples:
    # Input: nums = [7, 2, 5, 10, 8], m = 2
    # Output: 18
    #
    # Input: nums = [1, 2, 3, 4, 5], m = 2
    # Output: 9
    #
    # Input: nums = [1, 4, 4], m = 3
    # Output: 4
    #
    # @param {Array<Integer>} nums
    # @param {Integer} m
    # @return {Integer}
    def split_array(nums, m)
      lo = nums.max
      hi = nums.sum

      while lo <= hi
        mid = ((hi - lo) / 2) + lo

        sub_arrays = nums.reduce([0, 1]) { |(sum, count), num|
          if sum + num <= mid
            sum += num
          else
            sum = num
            count += 1
          end

          [sum, count]
        }.last

        if sub_arrays <= m
          hi = mid - 1
        else
          lo = mid + 1
        end
      end

      lo
    end
  end
end
