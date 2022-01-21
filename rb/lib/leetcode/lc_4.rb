# frozen_string_literal: true

module LeetCode
  # 4. Median of Two Sorted Arrays
  module LC4
    # Description:
    # Given two sorted arrays nums1 and nums2 of size m and n respectively,
    # return the median of the two sorted arrays.
    #
    # The overall run time complexity should be O(log (m+n)).
    #
    # Examples:
    # Input: nums1 = [1, 3], nums2 = [2]
    # Output: 2.00000
    #
    # Input: nums1 = [1, 2], nums2 = [3, 4]
    # Output: 2.50000
    #
    # @param {Array<Integer>} nums1
    # @param {Array<Integer>} nums2
    # @return {Float}
    def find_median_sorted_arrays(nums1, nums2)
      nums1, nums2 = nums2, nums1 if nums1.length > nums2.length

      lo = 0
      hi = nums1.length - 1

      while lo <= nums1.length && hi >= -1
        nums1_mid = ((hi - lo) / 2) + lo
        nums2_mid = (((nums1.length + nums2.length) / 2) - 1) - (nums1_mid + 1)

        nums1_l = nums1_mid >= 0 ? nums1[nums1_mid] : -Float::INFINITY
        nums1_r = nums1_mid + 1 < nums1.length ? nums1[nums1_mid + 1] : Float::INFINITY

        nums2_l = nums2_mid >= 0 ? nums2[nums2_mid] : -Float::INFINITY
        nums2_r = nums2_mid + 1 < nums2.length ? nums2[nums2_mid + 1] : Float::INFINITY

        if nums1_l <= nums2_r && nums2_l <= nums1_r
          if (nums1.length + nums2.length) % 2 == 0
            return ([nums1_l, nums2_l].max + [nums1_r, nums2_r].min).fdiv(2)
          else
            return [nums1_r, nums2_r].min.to_f
          end
        elsif nums1_l > nums2_r
          hi = nums1_mid - 1
        else
          lo = nums1_mid + 1
        end
      end

      raise
    end
  end
end
