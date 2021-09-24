# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_189")

module LeetCode
  class TestLC189 < Minitest::Test
    include(LC189)

    [
      [[1], 5, [1]],
      [[1, 2], 0, [1, 2]],
      [[1, 2], 2, [1, 2]],
      [[1, 2, 3], 1, [3, 1, 2]],
      [[1, 2, 3], 2, [2, 3, 1]],
      [[1, 2, 3, 4], 2, [3, 4, 1, 2]],
      [[1, 2, 3, 4, 5, 6], 2, [5, 6, 1, 2, 3, 4]],
      [[1, 2, 3, 4, 5, 6], 3, [4, 5, 6, 1, 2, 3]],
      [[1, 2, 3, 4, 5, 6, 7], 3, [5, 6, 7, 1, 2, 3, 4]]
    ].each.with_index { |(list, steps, expected), i|
      define_method(:"test_rotate_#{i}") {
        rotate(list, steps)
        assert_equal(expected, list)
      }
    }
  end
end
