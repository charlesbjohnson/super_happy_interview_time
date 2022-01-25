# frozen_string_literal: true

module LeetCode
  # 454. 4Sum II
  module LC454
    # Description:
    # Given four integer arrays nums1, nums2, nums3, and nums4 all of length n,
    # return the number of tuples (i, j, k, l) such that:
    # - 0 <= i, j, k, l < n
    # - nums1[i] + nums2[j] + nums3[k] + nums4[l] == 0
    #
    # Examples:
    # Input: nums1 = [1, 2], nums2 = [-2, -1], nums3 = [-1, 2], nums4 = [0, 2]
    # Output: 2
    #
    # Input: nums1 = [0], nums2 = [0], nums3 = [0], nums4 = [0]
    # Output: 1
    #
    # @param {Array<Integer>} nums1
    # @param {Array<Integer>} nums2
    # @param {Array<Integer>} nums3
    # @param {Array<Integer>} nums4
    # @return {Integer}
    def four_sum_count(nums1, nums2, nums3, nums4)
      hash = Hash.new(0)
      result = 0

      nums1.each { |num1|
        nums2.each { |num2|
          hash[num1 + num2] += 1
        }
      }

      nums3.each { |num3|
        nums4.each { |num4|
          result += hash[-(num3 + num4)]
        }
      }

      result
    end
  end
end
