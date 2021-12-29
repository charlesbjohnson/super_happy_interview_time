# frozen_string_literal: true

module LeetCode
  # 67. Add Binary
  module LC67
    # Description:
    # Given two binary strings a and b, return their sum as a binary string.
    #
    # Examples:
    # Input: a = "11", b = "1"
    # Output: "100"
    #
    # Input: a = "1010", b = "1011"
    # Output: "10101"
    #
    # @param {String} a
    # @param {String} b
    # @return {String}
    def add_binary(a, b)
      (a.to_i(2) + b.to_i(2)).to_s(2)
    end
  end
end
