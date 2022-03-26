# frozen_string_literal: true

module LeetCode
  # 209. Minimum Size Subarray Sum
  module LC209
    # Description:
    # Given an array of positive integers nums and a positive integer target,
    # return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target.
    #
    # If there is no such subarray, return 0 instead.
    #
    # Examples:
    # Input: target = 7, nums = [2, 3, 1, 2, 4, 3]
    # Output: 2
    #
    # Input: target = 4, nums = [1, 4, 4]
    # Output: 1
    #
    # Input: target = 11, nums = [1, 1, 1, 1, 1, 1, 1, 1]
    # Output: 0
    #
    # @param {Integer} target
    # @param {Array<Integer>} nums
    # @return {Integer}
    def min_sub_array_len(target, nums)
      result = private_methods.grep(/^min_sub_array_len_\d+$/).map { |m| send(m, target, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def min_sub_array_len_1(target, nums)
      result = Float::INFINITY

      sums = Array.new(nums.length)
      (0...nums.length).each { |i|
        sums[i] = nums[i] + (i > 0 ? sums[i - 1] : 0)
      }

      lo = 1
      hi = nums.length

      while lo <= hi
        mid = ((hi - lo) / 2) + lo
        sum = (0...(nums.length - (mid - 1))).map { |i| sums[i + (mid - 1)] - (i > 0 ? sums[i - 1] : 0) }.max

        case target <=> sum
        when -1, 0
          hi = mid - 1
          result = [result, mid].min
        when 1
          lo = mid + 1
        end
      end

      result.finite? ? result : 0
    end

    def min_sub_array_len_2(target, nums)
      result = Float::INFINITY

      i = 0
      j = 0

      sum = 0

      while (i < nums.length && target <= sum) || j < nums.length
        case target <=> sum
        when -1, 0
          sum -= nums[i]
          i += 1
          j = [i, j].max
        when 1
          sum += nums[j]
          j += 1
        end

        result = [result, j - i].min if target <= sum
      end

      result.finite? ? result : 0
    end

    def min_sub_array_len_3(target, nums)
      result = Float::INFINITY

      i = 0
      j = 0

      sum = 0

      while j < nums.length
        sum += nums[j]
        j += 1

        while sum >= target
          result = [result, j - i].min
          sum -= nums[i]
          i += 1
        end
      end

      result.finite? ? result : 0
    end
  end
end
