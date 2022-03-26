# frozen_string_literal: true

module LeetCode
  # 198. House Robber
  module LC198
    # Description:
    # You are a professional robber planning to rob houses along a street.
    #
    # Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them
    # is that adjacent houses have security systems connected and it will automatically contact the police if
    # two adjacent houses were broken into on the same night.
    #
    # Given an integer array nums representing the amount of money of each house,
    # return the maximum amount of money you can rob tonight without alerting the police.
    #
    # Examples:
    # Input: nums = [1, 2, 3, 1]
    # Output: 4
    #
    # Input: nums = [2, 7, 9, 3, 1]
    # Output: 12
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def rob(nums)
      result = private_methods.grep(/^rob_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def rob_1(nums)
      cache = {}

      rec = ->(i) {
        return 0 if i == nums.length
        return nums[i] if i == nums.length - 1

        cache[i] ||= [
          nums[i] + rec.call(i + 2),
          rec.call(i + 1)
        ].max
      }

      rec.call(0)
    end

    def rob_2(nums)
      cache = Array.new(nums.length + 1) { |i| i == nums.length - 1 ? nums[i] : 0 }

      (nums.length - 2).downto(0) { |i|
        cache[i] = [
          nums[i] + cache[i + 2],
          cache[i + 1]
        ].max
      }

      cache[0]
    end
  end
end
