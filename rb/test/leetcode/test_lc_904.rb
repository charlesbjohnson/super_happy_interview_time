# frozen_string_literal: true

require("config")
require("leetcode/lc_904")

module LeetCode
  class TestLC904 < Minitest::Test
    include(LC904)

    [
      [[0], 1],
      [[0, 0], 2],
      [[0, 1], 2],
      [[0, 1, 1], 3],
      [[0, 1, 2], 2],
      [[0, 1, 2, 2], 3],
      [[1, 2, 3, 2, 2], 4]
    ].each.with_index { |(fruits, expected), i|
      define_method(:"test_total_fruit_#{i}") {
        assert_equal(expected, total_fruit(fruits))
      }
    }
  end
end
