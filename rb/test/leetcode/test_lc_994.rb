# frozen_string_literal: true

require("config")
require("leetcode/lc_994")

module LeetCode
  class TestLC994 < Minitest::Test
    include(LC994)

    [
      [[[2, 1, 1], [1, 1, 0], [0, 1, 1]], 4],
      [[[2, 1, 1], [0, 1, 1], [1, 0, 1]], -1],
      [[[0, 2]], 0]
    ].each.with_index { |(grid, expected), i|
      define_method(:"test_oranges_rotting_#{i}") {
        assert_equal(expected, oranges_rotting(grid))
      }
    }
  end
end
