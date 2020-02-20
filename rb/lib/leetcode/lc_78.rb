# typed: true
# frozen_string_literal: true

module LeetCode
  # 78. Subsets
  module LC78
    def subsets_recurse(result, current, list)
      if list.empty?
        result.push(current)
        return
      end

      list = list.clone
      first = list.shift

      subsets_recurse(result, current, list)
      subsets_recurse(result, current + [first], list)
    end

    # Description:
    # Given a set of distinct integers, nums, return all possible subsets (the power set).
    #
    # Examples:
    # Input: [1, 2, 3]
    # Output: [
    #   [3],
    #   [1],
    #   [2],
    #   [1,2,3],
    #   [1,3],
    #   [2,3],
    #   [1,2],
    #   []
    # ]
    #
    # Notes:
    # The solution set must not contain duplicate subsets.
    #
    # @param list {Array<Integer>}
    # @return {Array<Array<Integer>>}
    def subsets(list)
      [].tap do |result|
        subsets_recurse(result, [], list)
      end
    end
  end
end
