# frozen_string_literal: true

require("config")
require("leetcode/lc_210")

module LeetCode
  class TestLC210 < Minitest::Test
    include(LC210)

    [
      [[1, []], [0]],
      [[2, [[1, 0]]], [0, 1]],
      [[2, [[1, 0], [0, 1]]], []],
      [[3, [[1, 0], [2, 1]]], [0, 1, 2]],
      [[3, [[1, 0], [2, 1], [0, 2]]], []],
      [[4, [[1, 0], [2, 0], [3, 1], [3, 2]]], [0, 1, 2, 3]]
    ].each.with_index { |((num_courses, prerequisites), expected), i|
      define_method(:"test_find_order_#{i}") {
        assert_equal(expected, find_order(num_courses, prerequisites))
      }
    }
  end
end
