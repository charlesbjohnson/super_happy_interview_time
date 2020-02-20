# typed: true
# frozen_string_literal: true

module LeetCode
  # 20. Valid Parentheses
  module LC20
    # Description:
    # Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
    # The brackets must close in the correct order.
    #
    # Examples:
    # - 1:
    #   Input: '()'
    #   Output: true
    #
    # - 2:
    #   Input: '()[]{}'
    #   Output: true
    #
    # - 3:
    #   Input: '(]'
    #   Output: false
    #
    # - 4:
    #   Input: '([)]'
    #   Output: false
    #
    # @param s {String}
    # @return {Boolean}
    def valid?(s)
      stack = []

      s.chars.each do |c|
        case c
        when '(', '[', '{'
          stack.push(c)
        when ')'
          return false if stack.pop != '('
        when ']'
          return false if stack.pop != '['
        when '}'
          return false if stack.pop != '{'
        end
      end

      stack.empty?
    end

    alias is_valid valid?
  end
end
