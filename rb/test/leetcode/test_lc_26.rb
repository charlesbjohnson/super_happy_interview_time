# frozen_string_literal: true

require("config")
require("leetcode/lc_26")

module LeetCode
  class TestLC26 < Minitest::Test
    include(LC26)

    [
      [[1, 1], [1]],
      [[1, 2], [1, 2]],
      [[1, 1, 2], [1, 2]],
      [[1, 1, 1, 1, 2, 3, 4], [1, 2, 3, 4]],
      [[1, 2, 2, 2, 2, 3, 4], [1, 2, 3, 4]],
      [[1, 2, 3, 4, 4, 4, 4], [1, 2, 3, 4]],
      [[0, 0, 1, 1, 1, 2, 2, 3, 3, 4], [0, 1, 2, 3, 4]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_remove_duplicates_#{i}") {
        assert_equal(expected.length, remove_duplicates(nums))
        assert_equal(expected, nums[...expected.length])
      }
    }
  end
end
