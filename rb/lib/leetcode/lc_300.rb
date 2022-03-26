# frozen_string_literal: true

module LeetCode
  # 300. Longest Increasing Subsequence
  module LC300
    # Description:
    # Given an integer array nums, return the length of the longest strictly increasing subsequence.
    #
    # A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements.
    # For example, [3, 6, 2, 7] is a subsequence of the array [0, 3, 1, 6, 2, 2, 7].
    #
    # Examples:
    # Input: nums = [10, 9, 2, 5, 3, 7, 101, 18]
    # Output: 4
    #
    # Input: nums = [0, 1, 0, 3, 2, 3]
    # Output: 4
    #
    # Input: nums = [7, 7, 7, 7, 7, 7, 7]
    # Output: 1
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def length_of_lis(nums)
      result = private_methods.grep(/^length_of_lis_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def length_of_lis_1(nums)
      cache = {}

      rec = ->(i) {
        return 1 if i == nums.length - 1

        cache[i] ||= ((i + 1)...nums.length).map { |j|
          nums[i] < nums[j] ? 1 + rec.call(j) : 1
        }.max
      }

      (0...nums.length).map { |i| rec.call(i) }.max
    end

    def length_of_lis_2(nums)
      cache = Array.new(nums.length, 1)

      (nums.length - 2).downto(0) { |i|
        cache[i] = ((i + 1)...nums.length).map { |j|
          nums[i] < nums[j] ? 1 + cache[j] : 1
        }.max
      }

      cache.max
    end

    def length_of_lis_3(nums)
      subsequence = [nums[0]]

      (0...nums.length).each { |i|
        if subsequence[-1] < nums[i]
          subsequence.push(nums[i])
        else
          subsequence[subsequence.index { |v| v >= nums[i] }] = nums[i]
        end
      }

      subsequence.length
    end
  end
end
