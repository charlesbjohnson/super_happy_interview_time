# frozen_string_literal: true

require("config")
require("leetcode/lc_217")

module LeetCode
  class TestLC217 < Minitest::Test
    include(LC217)

    [
      [[], false],
      [[1], false],
      [[1, 2], false],
      [[1, 1], true],
      [[1, 2, 3, 1], true],
      [[1, 2, 3, 4], false],
      [[1, 1, 1, 3, 3, 4, 3, 2, 4, 2], true]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_contains_duplicate_#{i}") {
        assert_equal(expected, contains_duplicate(nums))
      }
    }
  end
end
