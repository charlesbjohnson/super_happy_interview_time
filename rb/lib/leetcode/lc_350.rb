# frozen_string_literal: true

module LeetCode
  # 350. Intersection of Two Arrays II
  module LC350
    # Description:
    # Given two integer arrays nums1 and nums2, return an array of their intersection.
    # Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
    #
    # Follow up:
    # - What if the given array is already sorted? How would you optimize your algorithm?
    # - What if nums1's size is small compared to nums2's size? Which algorithm is better?
    # - What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
    #
    # Examples:
    #
    # Input: nums1 = [1, 2, 2, 1], nums2 = [2, 2]
    # Output: [2, 2]
    #
    # Input: nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4]
    # Output: [4, 9]
    #
    # @param {Array<Integer>} nums1
    # @param {Array<Integer>} nums2
    # @return {Array<Integer>}
    def intersect(nums1, nums2)
      result = []
      counts = Hash.new(0)

      nums1.each { |num1| counts[num1] += 1 }
      nums2.each { |num2|
        if counts[num2] > 0
          counts[num2] -= 1
          result.push(num2)
        end
      }

      result.sort!
    end
  end
end
