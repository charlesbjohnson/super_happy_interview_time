# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_29"

module LeetCode
  class TestLC29 < Minitest::Test
    include LC29

    [
      [1, 1, 1],
      [1, 2, 0],
      [12, 2, 6],
      [-20, 4, -5],
      [-49, -7, 7],
      [2**32, 1, MAX],
      [-(2**32), 1, MIN]
    ].each.with_index do |(dividend, divisor, expected), i|
      define_method(:"test_divide_#{i}") do
        assert_equal(expected, divide(dividend, divisor))
      end
    end
  end
end
