# frozen_string_literal: true

module LeetCode
  # 494. Target Sum
  module LC494
    # Description:
    # You are given an integer array nums and an integer target.
    #
    # You want to build an expression out of nums by adding one of the symbols '+' and '-'
    # before each integer in nums and then concatenate all the integers.
    #
    # For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1
    # and concatenate them to build the expression "+2-1".
    #
    # Return the number of different expressions that you can build, which evaluates to target.
    #
    # Examples:
    # Input: nums = [1, 1, 1, 1, 1],  target = 3
    # Output: 5
    #
    # Input: nums = [1], target = 1
    # Output: 1
    #
    # @param {Array<Integer>} nums
    # @param {Integer} target
    # @return {Integer}
    def find_target_sum_ways(nums, target)
      result = private_methods.grep(/^find_target_sum_ways_\d+$/).map { |m| send(m, nums, target) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_target_sum_ways_1(nums, target)
      cache = {}

      rec = ->(i, sum) {
        return (sum == target ? 1 : 0) if i == nums.length

        cache[[i, sum]] ||= rec.call(i + 1, sum + nums[i]) + rec.call(i + 1, sum + -nums[i])
      }

      rec.call(0, 0)
    end

    def find_target_sum_ways_2(nums, target)
      cache = Hash.new(0)
      stack = [[0, 0, false]]

      until stack.empty?
        i, sum, backtrack = stack.pop

        key = [i, sum]
        next if cache.key?(key)

        if backtrack
          cache[key] = cache[[i + 1, sum + nums[i]]] + cache[[i + 1, sum + -nums[i]]]
          next
        end

        if i == nums.length
          cache[key] = 1 if sum == target
          next
        end

        stack.push([i, sum, true])
        stack.push([i + 1, sum + -nums[i], false])
        stack.push([i + 1, sum + nums[i], false])
      end

      cache[[0, 0]]
    end

    def find_target_sum_ways_3(nums, target)
      max = nums.sum
      min = -max

      cache = Array.new(nums.length + 1) { Hash.new(0) }
      cache[nums.length][target] = 1

      (nums.length - 1).downto(0) { |i|
        max.downto(min) { |sum|
          cache[i][sum] = cache[i + 1][sum + nums[i]] + cache[i + 1][sum + -nums[i]]
        }
      }

      cache[0][0]
    end
  end
end
