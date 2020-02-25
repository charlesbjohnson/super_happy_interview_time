# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_15"

module LeetCode
  class TestLC15 < Minitest::Test
    include LC15

    [
      [[0, 0, 0], [[0, 0, 0]]],
      [[-1, 0, 1, 2, -1, -4], [[-1, 0, 1], [-1, -1, 2]].sort],
      [[-4, -2, -2, -2, 0, 1, 2, 2, 2, 3, 3, 4, 4, 6, 6], [[-4, -2, 6], [-4, 0, 4], [-4, 1, 3], [-4, 2, 2], [-2, -2, 4], [-2, 0, 2]].sort],
    ].each.with_index do |(list, expected), i|
      define_method(:"test_three_sum_#{i}") do
        assert_equal(expected, three_sum(list).sort)
      end
    end
  end
end
