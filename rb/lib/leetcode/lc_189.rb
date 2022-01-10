# frozen_string_literal: true

module LeetCode
  # 189. Rotate Array
  module LC189
    # Description:
    # Given an array, rotate the array to the right by k steps, where k is non-negative.
    #
    # Examples:
    # Input: nums = [1, 2, 3, 4, 5, 6, 7], k = 3
    # Output: [5, 6, 7, 1, 2, 3, 4]
    #
    # Input: nums = [-1, -100, 3, 99], k = 2
    # Output: [3, 99, -1, -100]
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {nil}
    def rotate(nums, k)
      k %= nums.length
      return if k == 0

      placed = 0
      i = 0

      while placed < nums.length
        start = i

        place = start
        placing = nums[place]

        loop {
          next_place = (place + k) % nums.length

          nums[next_place], placing = placing, nums[next_place]
          placed += 1

          place = next_place
          break if place == start
        }

        i += 1
      end

      nil
    end
  end
end
