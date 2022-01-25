# frozen_string_literal: true

require("config")
require("leetcode/lc_219")

module LeetCode
  class TestLC219 < Minitest::Test
    include(LC219)

    [
      [[[1, 2, 3, 1], 3], true],
      [[[1, 0, 1, 1], 1], true],
      [[[1, 2, 3, 1, 2, 3], 2], false]
    ].each.with_index { |((nums, k), expected), i|
      define_method(:"test_contains_nearby_duplicate_#{i}") {
        assert_equal(expected, contains_nearby_duplicate(nums, k))
      }
    }
  end
end
