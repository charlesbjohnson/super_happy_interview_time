# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_96")

module LeetCode
  class TestLC96 < Minitest::Test
    include(LC96)

    [
      [-1, 0],
      [0, 0],
      [1, 1],
      [2, 2],
      [3, 5],
      [4, 14],
      [5, 42],
      [6, 132]
    ].each.with_index do |(n, expected), i|
      define_method(:"test_num_trees_#{i}") do
        assert_equal(expected, num_trees(n))
      end
    end
  end
end
