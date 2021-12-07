# frozen_string_literal: true

require("config")
require("leetcode/lc_88")

module LeetCode
  class TestLC88 < Minitest::Test
    include(LC88)

    [
      [[], [], []],
      [[0], [], [0]],
      [[], [0], [0]],
      [[1], [2], [1, 2]],
      [[2], [1], [1, 2]],
      [[1, 3], [2], [1, 2, 3]],
      [[2], [1, 3], [1, 2, 3]],
      [[1, 2, 3], [-1, 0], [-1, 0, 1, 2, 3]],
      [[-1, 0], [1, 2, 3], [-1, 0, 1, 2, 3]]
    ].each.with_index { |(left, right, expected), i|
      define_method(:"test_merge_#{i}") {
        merge(left, left.length, right, right.length)
        assert_equal(expected, left)
      }
    }
  end
end
