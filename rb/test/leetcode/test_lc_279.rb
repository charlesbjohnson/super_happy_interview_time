# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_279")

module LeetCode
  class TestLC279 < Minitest::Test
    include(LC279)

    [
      [1, 1],
      [10, 2],
      [12, 3],
      [13, 2],
      [23, 4],
      [42, 3],
      [100, 1],
      [80, 2],
      [85, 2]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_num_squares_#{i}") {
        assert_equal(expected, num_squares(n))
      }
    }
  end
end
