# frozen_string_literal: true

require("config")
require("leetcode/lc_119")

module LeetCode
  class TestLC119 < Minitest::Test
    include(LC119)

    [
      [0, [1]],
      [1, [1, 1]],
      [2, [1, 2, 1]],
      [3, [1, 3, 3, 1]],
      [4, [1, 4, 6, 4, 1]]
    ].each.with_index { |(row_index, expected), i|
      define_method(:"test_get_row_#{i}") {
        assert_equal(expected, get_row(row_index))
      }
    }
  end
end
