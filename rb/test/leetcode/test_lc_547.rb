# frozen_string_literal: true

require("config")
require("helpers/leetcode/union_find")

require("leetcode/lc_547")

module LeetCode
  class TestLC547 < Minitest::Test
    include(LC547)

    [
      [[[1, 1], [1, 1]], 1],
      [[[1, 0], [0, 1]], 2],
      [[[1, 1, 0], [1, 1, 0], [0, 0, 1]], 2],
      [[[1, 0, 0], [0, 1, 0], [0, 0, 1]], 3]
    ].each.with_index { |(is_connected, expected), i|
      define_method(:"test_find_circle_num_#{i}") {
        assert_equal(expected, find_circle_num(is_connected))
      }
    }
  end
end
