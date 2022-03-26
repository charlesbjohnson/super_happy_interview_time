# frozen_string_literal: true

require("config")
require("leetcode/lc_673")

module LeetCode
  class TestLC673 < Minitest::Test
    include(LC673)

    [
      [[1], 1],
      [[1, 1], 2],
      [[1, 2], 1],
      [[1, 3, 2], 2],
      [[1, 2, 1, 2], 3],
      [[1, 3, 5, 4, 7], 2],
      [[2, 2, 2, 2, 2], 5]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_find_number_of_lis_#{i}") {
        assert_equal(expected, find_number_of_lis(nums))
      }
    }
  end
end
