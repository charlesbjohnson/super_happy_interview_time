# frozen_string_literal: true

require("config")
require("leetcode/lc_350")

module LeetCode
  class TestLC350 < Minitest::Test
    include(LC350)

    [
      [[], [], []],
      [[1, 2, 2, 1], [2, 2], [2, 2]]
    ].each.with_index { |(left, right, expected), i|
      define_method(:"test_intersect_#{i}") {
        assert_equal(expected, intersect(left, right))
      }
    }
  end
end
