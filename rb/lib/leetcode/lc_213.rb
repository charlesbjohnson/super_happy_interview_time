# frozen_string_literal: true

module LeetCode
  # 213. House Robber II
  module LC213
    # Description:
    # You are a professional robber planning to rob houses along a street.
    #
    # Each house has a certain amount of money stashed. All houses at this place are arranged in a circle.
    # That means the first house is the neighbor of the last one.
    #
    # Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if
    # two adjacent houses were broken into on the same night.
    #
    # Given an integer array nums representing the amount of money of each house,
    # return the maximum amount of money you can rob tonight without alerting the police.
    #
    # Examples:
    # Input: nums = [2, 3, 2]
    # Output: 3
    #
    # Input: nums = [1, 2, 3, 1]
    # Output: 4
    #
    # Input: nums = [1, 2, 3]
    # Output: 3
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

      rec = ->(i, f) {
        return 0 if i == nums.length
        return !f ? nums[i] : 0 if i == nums.length - 1

        cache[[i, f]] ||= [
          nums[i] + rec.call(i + 2, i == 0 ? true : f),
          rec.call(i + 1, f)
        ].max
      }

      rec.call(0, false)
    end

    def rob_2(nums)
      return nums[0] if nums.length == 1

      cache = Array.new(nums.length + 1) { Array.new(2, 0) }
      cache[nums.length - 1][0] = nums[-1]

      (nums.length - 2).downto(0) { |i|
        (0..1).each { |f|
          next if (i == 0 || i == 1) && f == 1

          cache[i][f] = [
            nums[i] + cache[i + 2][i == 0 ? 1 : f],
            cache[i + 1][f]
          ].max
        }
      }

      cache[0][0]
    end
  end
end
