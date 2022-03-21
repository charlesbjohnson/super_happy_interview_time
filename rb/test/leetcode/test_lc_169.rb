# frozen_string_literal: true

require("config")
require("leetcode/lc_169")

module LeetCode
  class TestLC169 < Minitest::Test
    include(LC169)

    [
      [[1, 1, 2], 1],
      [[1, 2, 2], 2],
      [[3, 2, 3], 3],
      [[2, 2, 1, 1, 1, 2, 2], 2]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_majority_element_#{i}") {
        assert_equal(expected, majority_element(nums))
      }
    }
  end
end
