# frozen_string_literal: true

module LeetCode
  # 283. Move Zeroes
  module LC283
    # Description:
    # Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
    # Note that you must do this in-place without making a copy of the array.
    #
    # Follow up: Could you minimize the total number of operations done?
    #
    # Examples:
    # Input: list = [0, 1, 0, 3, 12]
    # Output: nil
    #
    # Input: nums = [0]
    # Output: [0]
    #
    # @param {Array<Integer>} nums
    # @return {nil}
    def move_zeroes(nums)
      i = 0
      j = 1

      while i < nums.length && j < nums.length
        if nums[i] != 0
          i += 1
          j += 1
          next
        end

        if nums[j] == 0
          j += 1
          next
        end

        nums[i] = nums[j]
        nums[j] = 0
      end

      nil
    end
  end
end
