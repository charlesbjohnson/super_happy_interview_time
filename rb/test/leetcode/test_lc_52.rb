# frozen_string_literal: true

require("config")
require("leetcode/lc_52")

module LeetCode
  class TestLC52 < Minitest::Test
    include(LC52)

    [
      [1, 1],
      [2, 0],
      [3, 0],
      [4, 2],
      [5, 10]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_total_n_queens_#{i}") {
        assert_equal(expected, total_n_queens(n))
      }
    }
  end
end
