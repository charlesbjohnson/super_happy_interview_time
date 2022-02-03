# frozen_string_literal: true

module LeetCode
  # 912. Sort an Array
  module LC912
    # Description:
    # Given an array of integers nums, sort the array in ascending order.
    #
    # Examples:
    # Input: nums = [5, 2, 3, 1]
    # Output: [1, 2, 3, 5]
    #
    # Input: nums = [5, 1, 1, 2, 0, 0]
    # Output: [0, 0, 1, 1, 2, 5]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Integer>}
    def sort_array(nums)
      r_sort_array(nums)
    end

    private

    def r_sort_array(nums)
      return nums.clone if nums.empty? || nums.length == 1

      mid = (nums.length / 2)

      left = r_sort_array(nums[...mid])
      right = r_sort_array(nums[mid..])

      merge(left, right)
    end

    def merge(left, right)
      result = Array.new(left.length + right.length)

      l = 0
      r = 0

      result.each_index { |i|
        if l < left.length && r < right.length
          case left[l] <=> right[r]
          when -1
            result[i] = left[l]
            l += 1
          when 0, 1
            result[i] = right[r]
            r += 1
          end
        elsif r >= right.length
          result[i] = left[l]
          l += 1
        elsif l >= left.length
          result[i] = right[r]
          r += 1
        end
      }

      result
    end
  end
end
