# frozen_string_literal: true

module LeetCode
  # 718. Maximum Length of Repeated Subarray
  module LC718
    # Description:
    # Given two integer arrays nums1 and nums2, return the maximum length of a subarray that appears in both arrays.
    #
    # Examples:
    # Input: nums1 = [1, 2, 3, 2, 1], nums2 = [3, 2, 1, 4, 7]
    # Output: 3
    #
    # Input: nums1 = [0, 0, 0, 0, 0], nums2 = [0, 0, 0, 0, 0]
    # Output: 5
    #
    # @param {Array<Integer>} nums1
    # @param {Array<Integer>} nums2
    # @return {Integer}
    def find_length(nums1, nums2)
      result = private_methods.grep(/^find_length_\d+$/).map { |m| send(m, nums1, nums2) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_length_1(nums1, nums2)
      result = 0
      cache = {}

      rec = ->(i, j) {
        return 0 if i == nums1.length || j == nums2.length

        key = [i, j]
        return cache[key] if cache.key?(key)

        rec.call(i + 1, j) if i + 1 < nums1.length
        rec.call(i, j + 1) if j + 1 < nums2.length

        cache[key] ||= nums1[i] == nums2[j] ? 1 + rec.call(i + 1, j + 1) : 0

        result = [result, cache[key]].max
        cache[key]
      }

      rec.call(0, 0)
      result
    end

    def find_length_2(nums1, nums2)
      result = 0
      cache = Array.new(nums1.length + 1) { Array.new(nums2.length + 1, 0) }

      (nums1.length - 1).downto(0) { |i|
        (nums2.length - 1).downto(0) { |j|
          if nums1[i] == nums2[j]
            cache[i][j] = cache[i + 1][j + 1] + 1
            result = [result, cache[i][j]].max
          end
        }
      }

      result
    end
  end
end
