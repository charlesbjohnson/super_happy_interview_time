# typed: true
# frozen_string_literal: true

module LeetCode
  # 326. Power of Three
  module LC326
    # Description:
    # Given an integer, write a function to determine if it is a power of three.
    #
    # Notes:
    # - Could you do it without using any loop / recursion?
    #
    # @param n {Integer}
    # @return {Boolean}
    def power_of_three?(n)
      return false if n <= 0
      return true if n == 1

      power = Math.log(n, 3).round
      3**power == n
    end

    alias_method(:is_power_of_three, :power_of_three?)
  end
end
