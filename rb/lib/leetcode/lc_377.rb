# frozen_string_literal: true

module LeetCode
  # 377. Combination Sum IV
  module LC377
    # Description:
    # Given an array of distinct integers nums and a target integer target,
    # return the number of possible combinations that add up to target.
    #
    # The test cases are generated so that the answer can fit in a 32-bit integer.
    #
    # Follow up: What if negative numbers are allowed in the given array?
    # How does it change the problem? What limitation we need to add to the question to allow negative numbers?
    #
    # Examples:
    # Input: nums = [1, 2, 3], target = 4
    # Output: 7
    #
    # Input: nums = [9], target = 3
    # Output: 0
    #
    # @param {Array<Integer>} nums
    # @param {Integer} target
    # @return {Integer}
    def combination_sum4(nums, target)
      result = private_methods.grep(/^combination_sum4_\d+$/).map { |m| send(m, nums, target) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def combination_sum4_1(nums, target)
      cache = {}

      rec = ->(amount) {
        return 1 if amount == target

        cache[amount] ||= nums.sum { |num|
          amount + num <= target ? rec.call(amount + num) : 0
        }
      }

      rec.call(0)
    end

    def combination_sum4_2(nums, target)
      cache = Array.new(target + 1) { |amount| amount == target ? 1 : 0 }

      (target - 1).downto(0) { |amount|
        cache[amount] = nums.sum { |num|
          amount + num <= target ? cache[amount + num] : 0
        }
      }

      cache[0]
    end
  end
end
