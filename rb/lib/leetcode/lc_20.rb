# frozen_string_literal: true

module LeetCode
  # 20. Valid Parentheses
  module LC20
    # Description:
    # Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
    #
    # An input string is valid if:
    # - Open brackets must be closed by the same type of brackets.
    # - Open brackets must be closed in the correct order.
    #
    #
    # Examples:
    # Input: s = "()"
    # Output: true
    #
    # Input: s = "()[]{}"
    # Output: true
    #
    # Input: s = "(]"
    # Output: false
    #
    # @param {String} s
    # @return {Boolean}
    def is_valid(s)
      stack = []

      s.each_char { |c|
        case c
        when "(", "[", "{"
          stack.push(c)
        when ")"
          return false if stack.pop != "("
        when "]"
          return false if stack.pop != "["
        when "}"
          return false if stack.pop != "{"
        end
      }

      stack.empty?
    end
  end
end
