# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_69"

module LeetCode
  class TestLC69 < Minitest::Test
    include LC69

    [
      [4, 2],
      [9, 3],
      [16, 4],
      [8, 2],
      [10, 3],
      [15, 3],
      [20, 4],
      [30, 5]
    ].each.with_index do |(x, expected), i|
      define_method(:"test_my_sqrt_#{i}") do
        assert_equal(expected, my_sqrt(x))
      end
    end
  end
end
