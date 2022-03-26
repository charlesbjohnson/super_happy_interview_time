# frozen_string_literal: true

module LeetCode
  # 75. Sort Colors
  module LC75
    # Description:
    # Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent,
    # with the colors in the order red, white, and blue.
    #
    # We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.
    #
    # You must solve this problem without using the library's sort function.
    #
    # Follow up: Could you come up with a one-pass algorithm using only constant extra space?
    #
    # Examples:
    # Input: nums = [2, 0, 2, 1, 1, 0]
    # Output: [0, 0, 1, 1, 2, 2]
    #
    # Input: nums = [2, 0, 1]
    # Output: [0, 1, 2]
    #
    # @param {Array<Integer>} nums
    # @return {nil}
    def sort_colors(nums)
      result = private_methods.grep(/^sort_colors_\d+$/).map { |m| nums.clone.tap { |clone| send(m, clone) } }.uniq
      result.length == 1 ? sort_colors_2(nums) : raise
    end

    private

    def sort_colors_1(nums)
      r = 0
      w = 0
      b = 0

      nums.each { |num|
        case num
        when 0
          r += 1
        when 1
          w += 1
        when 2
          b += 1
        end
      }

      nums.each_index { |i|
        if r > 0
          nums[i] = 0
          r -= 1
        elsif w > 0
          nums[i] = 1
          w -= 1
        elsif b > 0
          nums[i] = 2
          b -= 1
        end
      }

      nil
    end

    def sort_colors_2(nums)
      l = 0
      r = nums.length - 1

      i = l

      while i <= r
        if nums[i] == 0
          nums[l], nums[i] = nums[i], nums[l]
          l += 1
          i += 1
        elsif nums[i] == 2
          nums[r], nums[i] = nums[i], nums[r]
          r -= 1
        else
          i += 1
        end
      end

      nil
    end
  end
end
