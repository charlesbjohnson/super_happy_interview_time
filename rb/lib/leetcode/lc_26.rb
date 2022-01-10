# frozen_string_literal: true

module LeetCode
  # 26. Remove Duplicates from Sorted Array
  module LC26
    # Description:
    # Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once.
    # The relative order of the elements should be kept the same.
    #
    # Since it is impossible to change the length of the array in some languages,
    # you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.
    #
    # Return k after placing the final result in the first k slots of nums.
    #
    # Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
    #
    # Examples:
    # Input: nums = [1, 1, 2]
    # Output: 2, nums = [1, 2, _]
    #
    # Input: nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
    # Output: 5, nums = [0, 1, 2, 3, 4, _, _, _, _, _]
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def remove_duplicates(nums)
      return nums.length if nums.length <= 1

      i = 1
      j = i

      while i < nums.length && j < nums.length
        if nums[i - 1] < nums[i]
          i += 1
          next
        end

        j = [j, i].max

        if nums[i - 1] >= nums[j]
          j += 1
          next
        end

        nums[i] = nums[j]
      end

      i
    end
  end
end
