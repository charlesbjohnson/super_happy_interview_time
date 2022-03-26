# frozen_string_literal: true

module LeetCode
  # 81. Search in Rotated Sorted Array II
  module LC81
    # Description:
    # There is an integer array nums sorted in non-decreasing order (not necessarily with distinct values).
    #
    # Before being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length)
    # such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed).
    #
    # For example, [0, 1, 2, 4, 4, 4, 5, 6, 6, 7] might be rotated at pivot index 5 and become [4, 5, 6, 6, 7, 0, 1, 2, 4, 4].
    #
    # Given the array nums after the rotation and an integer target, return true if target is in nums, or false if it is not in nums.
    # You must decrease the overall operation steps as much as possible.
    #
    # Follow up: This problem is similar to Search in Rotated Sorted Array, but nums may contain duplicates.
    # Would this affect the runtime complexity? How and why?
    #
    # Examples:
    # Input: nums = [2, 5, 6, 0, 0, 1, 2], target = 0
    # Output: true
    #
    # Input: nums = [2, 5, 6, 0, 0, 1, 2], target = 3
    # Output: false
    #
    # @param {Array<Integer>} nums
    # @param {Integer} target
    # @return {Boolean}
    def search(nums, target)
      lo = 0
      hi = nums.length - 1

      while lo <= hi
        lo += 1 while lo < hi && nums[lo] == nums[lo + 1]
        hi -= 1 while lo < hi && nums[hi] == nums[hi - 1]

        mid = ((hi - lo) / 2) + lo

        case target <=> nums[mid]
        when 0
          return true
        when -1
          if target >= nums[lo] || nums[mid] < nums[lo]
            hi = mid - 1
          else
            lo = mid + 1
          end
        when 1
          if target <= nums[hi] || nums[mid] > nums[hi]
            lo = mid + 1
          else
            hi = mid - 1
          end
        end
      end

      false
    end
  end
end
