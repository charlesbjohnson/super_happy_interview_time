# frozen_string_literal: true

require("config")
require("leetcode/lc_658")

module LeetCode
  class TestLC658 < Minitest::Test
    include(LC658)

    [
      [[[1], 1, 1], [1]],
      [[[1, 2, 3], 2, 1], [1, 2]],
      [[[1, 2, 3], 2, -1], [1, 2]],
      [[[1, 2, 3], 2, 4], [2, 3]],
      [[[1, 2, 3, 4, 5], 4, 3], [1, 2, 3, 4]],
      [[[1, 1, 1, 10, 10, 10], 1, 9], [10]],
      [[[0, 0, 1, 2, 3, 3, 4, 7, 7, 8], 3, 5], [3, 3, 4]]
    ].each.with_index { |((arr, k, x), expected), i|
      define_method(:"test_find_closest_elements_#{i}") {
        assert_equal(expected, find_closest_elements(arr, k, x))
      }
    }
  end
end
