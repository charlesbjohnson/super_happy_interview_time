# frozen_string_literal: true

module LeetCode
  # 22. Generate Parentheses
  module LC22
    # Description:
    # Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
    #
    # Examples:
    #
    # Input: n = 3
    # Output: ["((()))", "(()())", "(())()", "()(())", "()()()"]
    #
    # Input: n = 1
    # Output: ["()"]
    #
    # @param {Integer} n
    # @return {Array<String>}
    def generate_parenthesis(n)
      result = []
      stack = [[0, 0, ""]]

      until stack.empty?
        l, r, current = stack.pop

        if current.length == n * 2
          result.unshift(current)
          next
        end

        stack.push([l + 1, r, current + "("]) if l < n
        stack.push([l, r + 1, current + ")"]) if r < l
      end

      result
    end
  end
end
