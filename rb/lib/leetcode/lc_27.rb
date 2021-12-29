# frozen_string_literal: true

module LeetCode
  # 27. Remove Element
  module LC27
    # Given an integer array nums and an integer val, remove all occurrences of val in nums in-place.
    # The relative order of the elements may be changed.
    #
    # Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums.
    # More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result.
    # It does not matter what you leave beyond the first k elements.
    #
    # Return k after placing the final result in the first k slots of nums.
    #
    # Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
    #
    # Examples:
    # Input: nums = [3, 2, 2, 3], val = 3
    # Output: 2, nums = [2, 2, _, _]
    #
    # Input: nums = [0, 1, 2, 2, 3, 0, 4, 2], val = 2
    # Output: 5, nums = [0, 1, 4, 0, 3, _, _, _]
    #
    # @param {Array<Integer>} nums
    # @param {Integer} val
    # @return {Integer}
    def remove_element(nums, val)
      return 0 if nums.empty?

      i = 0
      j = nums.length - 1

      while i <= j
        if nums[i] != val
          i += 1
          next
        end

        if nums[j] == val || nums[j].nil?
          nums[j] = nil
          j -= 1
          next
        end

        nums[i] = nums[j]
        nums[j] = nil
      end

      (i - 1).clamp(0, nums.length)
    end
  end
end
