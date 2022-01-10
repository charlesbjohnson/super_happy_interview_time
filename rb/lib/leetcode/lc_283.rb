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
    # Input: nums = [0, 1, 0, 3, 12]
    # Output: [1, 3, 12, 0, 0]
    #
    # Input: nums = [0]
    # Output: [0]
    #
    # @param {Array<Integer>} nums
    # @return {nil}
    def move_zeroes(nums)
      i = 0
      j = i

      while i < nums.length && j < nums.length
        if nums[i] != 0
          i += 1
          next
        end

        j = [j, i].max

        if nums[j] == 0
          j += 1
          next
        end

        nums[i], nums[j] = nums[j], nums[i]
      end

      nil
    end
  end
end
