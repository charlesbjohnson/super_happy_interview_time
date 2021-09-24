# typed: true
# frozen_string_literal: true

module LeetCode
  # 46. Permutations
  module LC46
    def permute_recurse(result, current, list)
      if list.length == 1
        result.push(current + list)
        return
      end

      list.each.with_index { |v, i|
        permute_recurse(result, current + [v], list[0...i] + list[(i + 1)..-1])
      }
    end

    # Description:
    # Given a collection of distinct numbers, return all possible permutations.
    #
    # Examples:
    # Input: [1, 2, 3]
    # Output: [
    #   [1, 2, 3],
    #   [1, 3, 2],
    #   [2, 1, 3],
    #   [2, 3, 1],
    #   [3, 1, 2],
    #   [3, 2, 1],
    # ]
    #
    # @param list {Array<Integer>}
    # @return {Array<Array<Integer>>}
    def permute(list)
      return [[]] if list.empty?

      [].tap { |result|
        permute_recurse(result, [], list)
      }
    end
  end
end
