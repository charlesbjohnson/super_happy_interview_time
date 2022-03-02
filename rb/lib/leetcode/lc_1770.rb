# frozen_string_literal: true

module LeetCode
  # 1770. Maximum Score from Performing Multiplication Operations
  module LC1770
    # Description:
    # You are given two integer arrays nums and multipliers of size n and m respectively, where n >= m. The arrays are 1-indexed.
    #
    # You begin with a score of 0. You want to perform exactly m operations. On the ith operation (1-indexed), you will:
    # - Choose one integer x from either the start or the end of the array nums.
    # - Add multipliers[i] * x to your score.
    # - Remove x from the array nums.
    #
    # Return the maximum score after performing m operations.
    #
    # Examples:
    # Input: nums = [1, 2, 3], multipliers = [3, 2, 1]
    # Output: 14
    #
    # Input: nums = [-5, -3, -3, -2, 7, 1], multipliers = [-10, -5, 3, 4, 6]
    # Output: 102
    #
    # @param {Array<Integer>} nums
    # @param {Array<Integer>} multipliers
    # @return {Integer}
    def maximum_score(nums, multipliers)
      result = private_methods.grep(/^maximum_score_\d+$/).map { |m| send(m, nums, multipliers) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def maximum_score_1(nums, multipliers)
      cache = {}

      rec = ->(i, l) {
        return 0 if i == multipliers.length

        r = (nums.length - 1) - (i - l)

        cache[[i, l]] ||= [
          (multipliers[i] * nums[l]) + rec.call(i + 1, l + 1),
          (multipliers[i] * nums[r]) + rec.call(i + 1, l)
        ].max
      }

      rec.call(0, 0)
    end

    def maximum_score_2(nums, multipliers)
      result = Array.new(multipliers.length + 1) { Array.new(multipliers.length + 1, 0) }

      (multipliers.length - 1).downto(0) { |i|
        i.downto(0) { |l|
          r = (nums.length - 1) - (i - l)

          result[i][l] = [
            (multipliers[i] * nums[l]) + result[i + 1][l + 1],
            (multipliers[i] * nums[r]) + result[i + 1][l]
          ].max
        }
      }

      result[0][0]
    end
  end
end
