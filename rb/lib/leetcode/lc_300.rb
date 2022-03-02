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
        return 0 if i == nums.length - 1

        cache[i] ||= ((i + 1)...nums.length).map { |j|
          i == -1 || nums[i] < nums[j] ? 1 + rec.call(j) : 0
        }.max
      }

      rec.call(-1)
    end

    def length_of_lis_2(nums)
      result = Array.new(nums.length + 2, 0)

      (nums.length - 1).downto(0) { |i|
        result[i] = ((i + 1)..nums.length).map { |j|
          i == 0 || nums[i - 1] < nums[j - 1] ? 1 + result[j] : 0
        }.max
      }

      result[0]
    end
  end
end
