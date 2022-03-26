# frozen_string_literal: true

require("config")
require("leetcode/lc_442")

module LeetCode
  class TestLC442 < Minitest::Test
    include(LC442)

    [
      [[1], []],
      [[1, 1, 2], [1]],
      [[1, 3, 1, 4], [1]],
      [[4, 3, 2, 7, 8, 2, 3, 1], [2, 3]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_find_duplicates_#{i}") {
        assert_equal(expected, find_duplicates(nums))
      }
    }
  end
end
