# frozen_string_literal: true

require("config")
require("leetcode/lc_34")

module LeetCode
  class TestLC34 < Minitest::Test
    include(LC34)

    [
      [[[], 0], [-1, -1]],
      [[[1], 0], [-1, -1]],
      [[[1], 1], [0, 0]],
      [[[1, 2, 2, 2, 3], 2], [1, 3]],
      [[[5, 7, 7, 8, 8, 10], 8], [3, 4]],
      [[[5, 7, 7, 8, 8, 10], 6], [-1, -1]]
    ].each.with_index { |((nums, target), expected), i|
      define_method(:"test_search_range_#{i}") {
        assert_equal(expected, search_range(nums, target))
      }
    }
  end
end
