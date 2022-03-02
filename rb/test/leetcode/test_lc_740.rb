# frozen_string_literal: true

require("config")
require("leetcode/lc_740")

module LeetCode
  class TestLC740 < Minitest::Test
    include(LC740)

    [
      [[1], 1],
      [[1, 2], 2],
      [[1, 1, 1], 3],
      [[1, 2, 1, 1], 3],
      [[3, 4, 2], 6],
      [[2, 2, 3, 3, 3, 4], 9]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_delete_and_earn_#{i}") {
        assert_equal(expected, delete_and_earn(nums))
      }
    }
  end
end
