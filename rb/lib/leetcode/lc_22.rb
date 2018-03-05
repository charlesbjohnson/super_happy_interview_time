# frozen_string_literal: true

module LeetCode
  # 22. Generate Parentheses
  module LC22
    def generate_parenthesis_recurse(result, current, left, right, n)
      if current.length == 2 * n
        result.push(current)
        return
      end

      generate_parenthesis_recurse(result, current + '(', left + 1, right, n) if left < n
      generate_parenthesis_recurse(result, current + ')', left, right + 1, n) if right < left
    end

    # Description:
    # Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
    #
    # Examples:
    # Input: 3
    # Output: [
    #   "((()))",
    #   "(()())",
    #   "(())()",
    #   "()(())",
    #   "()()()"
    # ]
    #
    # @param n {Integer}
    # @return {Array<String>}
    def generate_parenthesis(n)
      return [] if n < 1

      [].tap do |result|
        generate_parenthesis_recurse(result, '', 0, 0, n)
      end
    end
  end
end
