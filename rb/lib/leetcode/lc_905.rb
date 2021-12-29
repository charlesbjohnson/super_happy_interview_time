# frozen_string_literal: true

module LeetCode
  # 905. Sort Array By Parity
  module LC905
    # Description:
    # Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.
    #
    # Return any array that satisfies this condition.
    #
    # Examples:
    # Input: nums = [3, 1, 2, 4]
    # Output: [2, 4, 3, 1]
    #
    # Input: nums = [0]
    # Output: [0]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Integer>}
    def sort_array_by_parity(nums)
      i = 0
      j = nums.length - 1

      while i < j
        if nums[i] % 2 == 0
          i += 1
          next
        end

        if nums[j] % 2 == 1
          j -= 1
          next
        end

        nums[i], nums[j] = nums[j], nums[i]
      end

      nums
    end
  end
end
