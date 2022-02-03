# frozen_string_literal: true

module LeetCode
  # 46. Permutations
  module LC46
    # Description:
    # Given an array nums of distinct integers, return all the possible permutations.
    # You can return the answer in any order.
    #
    # Examples:
    # Input: nums = [1, 2, 3]
    # Output: [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    #
    # Input: nums = [0, 1]
    # Output: [[0, 1], [1, 0]]
    #
    # Input: nums = [1]
    # Output: [[1]]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Array<Integer>>}
    def permute(nums)
      result = []
      stack = [[[], nums]]

      until stack.empty?
        cur, rem = stack.pop

        if rem.empty?
          result.push(cur)
          next
        end

        rem.each_index { |i|
          stack.unshift([cur + [rem[i]], rem[...i] + rem[(i + 1)..]])
        }
      end

      result
    end
  end
end
