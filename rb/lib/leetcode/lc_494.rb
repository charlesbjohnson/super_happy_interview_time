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
      stack = []
      cache = {}

      stack.push([0, 0, false]) if nums.length > 0

      until stack.empty?
        i, sum, visited = stack.pop

        next if cache.key?([i, sum])

        if visited
          cache[[i, sum]] = cache[[i + 1, sum + nums[i]]] + cache[[i + 1, sum - nums[i]]]
          next
        end

        if i < nums.length - 1
          stack.push([i, sum, true])
          stack.push([i + 1, sum + nums[i], false])
          stack.push([i + 1, sum - nums[i], false])
        else
          cache[[i + 1, sum + nums[i]]] = sum + nums[i] == target ? 1 : 0
          cache[[i + 1, sum - nums[i]]] = sum - nums[i] == target ? 1 : 0
          cache[[i, sum]] = cache[[i + 1, sum + nums[i]]] + cache[[i + 1, sum - nums[i]]]
        end
      end

      cache.fetch([0, 0], 0)
    end
  end
end
