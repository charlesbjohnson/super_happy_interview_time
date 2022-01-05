# frozen_string_literal: true

module LeetCode
  # 150. Evaluate Reverse Polish Notation
  module LC150
    # Description:
    # Evaluate the value of an arithmetic expression in Reverse Polish Notation.
    #
    # Valid operators are +, -, *, and /. Each operand may be an integer or another expression.
    #
    # Note that division between two integers should truncate toward zero.
    #
    # It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.
    #
    # Examples:
    # Input: tokens = ["2", "1", "+", "3", "*"]
    # Output: 9
    #
    # Input: tokens = ["4", "13", "5", "/", "+"]
    # Output: 6
    #
    # Input: tokens = ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
    # Output: 22
    #
    # @param {Array<String>} tokens
    # @return {Integer}
    def eval_rpn(tokens)
      stack = []

      tokens.each { |token|
        case token
        when "+", "-", "*", "/"
          right, left = stack.pop, stack.pop

          case token
          when "+"
            stack.push(left + right)
          when "-"
            stack.push(left - right)
          when "*"
            stack.push(left * right)
          when "/"
            stack.push(Integer(left.fdiv(right).to_i))
          end
        else
          stack.push(token.to_i)
        end
      }

      stack.pop
    end
  end
end
