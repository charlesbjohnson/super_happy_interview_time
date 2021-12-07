# frozen_string_literal: true

module LeetCode
  # 494. Target Sum
  module LC494
    def find_target_sum_ways_recurse(list, sum, index, current, cache)
      if index == list.length
        return current == sum ? 1 : 0
      end

      return cache.dig(index, current) if cache.dig(index, current)

      value = list[index]
      add = find_target_sum_ways_recurse(list, sum, index + 1, current + value, cache)
      sub = find_target_sum_ways_recurse(list, sum, index + 1, current - value, cache)

      cache[index] = {} unless cache[index]
      cache[index][current] = add + sub
      add + sub
    end

    # Description:
    # You are given a list of non-negative integers and a target sum.
    # You have 2 symbols, + and -.
    # For each integer, choose either + or - as its new symbol.
    #
    # Find out how many ways to assign symbols to make the sum of integers equal to the target sum.
    #
    # Examples:
    # Input: list = [1, 1, 1, 1, 1], sum = 3
    # Output: 5
    # Explanation:
    # There are 5 ways to assign symbols to make the sum of the list be 3.
    #   1. - 1 + 1 + 1 + 1 + 1 = 3
    #   2. + 1 - 1 + 1 + 1 + 1 = 3
    #   3. + 1 + 1 - 1 + 1 + 1 = 3
    #   4. + 1 + 1 + 1 - 1 + 1 = 3
    #   5. + 1 + 1 + 1 + 1 - 1 = 3
    #
    # Notes:
    # - The length of the given array is positive and will not exceed 20.
    # - The sum of elements in the given array will not exceed 1000.
    # - Your output answer is guaranteed to fit in a 32-bit integer.
    #
    # @param list {Array<Integer>}
    # @param sum {Integer}
    # @return {Integer}
    def find_target_sum_ways(list, sum)
      find_target_sum_ways_recurse(list, sum, 0, 0, {})
    end
  end
end
