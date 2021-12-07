# frozen_string_literal: true

require("config")
require("leetcode/lc_371")

module LeetCode
  class TestLC371 < Minitest::Test
    include(LC371)

    [
      [0, 0, 0],
      [0, 1, 1],
      [1, 0, 1],
      [1, 2, 3],
      [5, 2, 7]
    ].each.with_index { |(left, right, expected), i|
      define_method(:"test_sum_#{i}") {
        assert_equal(expected, sum(left, right))
      }
    }
  end
end
