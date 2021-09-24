# typed: true
# frozen_string_literal: true

require("set")

module LeetCode
  # 39. Combination Sum
  module LC39
    def combination_sum_recurse(candidates, target, i, combination, combinations)
      return if i >= candidates.length
      return if combination.sum > target

      if combination.sum == target
        combinations.add(combination)
        return
      end

      combination_sum_recurse(candidates, target, i, combination + candidates[i..i], combinations)
      combination_sum_recurse(candidates, target, i + 1, combination, combinations)
    end

    # Description:
    # Given a set of candidate numbers (candidates) (without duplicates) and a target number (target),
    # find all unique combinations in candidates where the candidate numbers sums to target.
    #
    # The same repeated number may be chosen from candidates unlimited number of times.
    #
    # Examples:
    # - 1:
    #   Input: candidates = [2, 3, 6, 7], target = 7
    #   Output: [
    #     [7],
    #     [2, 2, 3]
    #   ]
    #
    # - 2:
    #   Input: candidates = [2, 3, 5], target = 8
    #   Output: [
    #     [2, 2, 2, 2],
    #     [2, 3, 3],
    #     [3, 5]
    #   ]
    #
    # Notes:
    # - All numbers (including target) will be positive integers.
    # - The solution set must not contain duplicate combinations.
    #
    # @param candidates {Array<Integer>}
    # @param target {Integer}
    # @return {Array<Array<Integer>>}
    def combination_sum(candidates, target)
      result = Set.new

      return result if candidates.empty? || target.negative?

      result.add([target]) if candidates.any?(target)

      candidates = candidates.sort.reject { |v| v >= target }

      combination_sum_recurse(candidates, target, 0, [], result)
      result.to_a
    end
  end
end
