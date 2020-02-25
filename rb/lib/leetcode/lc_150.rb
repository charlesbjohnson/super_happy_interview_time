# typed: true
# frozen_string_literal: true

module LeetCode
  # 150. Evaluate Reverse Polish Notation
  module LC150
    # Description:
    # Evaluate the value of an arithmetic expression in Reverse Polish Notation.
    # Valid operators are +, -, *, /.
    # Each operand may be an integer or another expression.
    #
    # Examples:
    # - 1:
    #   Input: ["2", "1", "+", "3", "*"]
    #   Output: 9
    #
    # - 2:
    #   Input: ["4", "13", "5", "/", "+"]
    #   Output: 5
    #
    # @param tokens {Array<String>}
    # @return {Integer}
    def eval_rpn(tokens)
      stack = []

      tokens.each do |token|
        case token
        when "*"
          stack.push(stack.pop * stack.pop)
        when "/"
          right = stack.pop
          left = stack.pop
          stack.push((left / right.to_f).to_i)
        when "+"
          stack.push(stack.pop + stack.pop)
        when "-"
          right = stack.pop
          left = stack.pop
          stack.push(left - right)
        else
          stack.push(token.to_i)
        end
      end

      stack.pop
    end
  end
end
