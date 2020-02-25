# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_349"

module LeetCode
  class TestLC349 < Minitest::Test
    include LC349

    [
      [[], [], []],
      [[1, 2, 2, 1], [2, 2], [2]],
    ].each.with_index do |(left, right, expected), i|
      define_method(:"test_intersection_#{i}") do
        assert_equal(expected, intersection(left, right))
      end
    end
  end
end
