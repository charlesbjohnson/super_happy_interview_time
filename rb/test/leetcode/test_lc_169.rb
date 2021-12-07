# frozen_string_literal: true

require("config")
require("leetcode/lc_169")

module LeetCode
  class TestLC169 < Minitest::Test
    include(LC169)

    [
      [[0, 1, 2], 1],
      [[1, 1, 2], 1],
      [[0, 2, 2], 2],
      [[0, 1, 2, 3, 4, 5], 3],
      [[1, 1, 1, 1, 3, 4], 1],
      [[0, 1, 4, 4, 4, 4], 4]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_majority_element_#{i}") {
        assert_equal(expected, majority_element(list))
      }
    }
  end
end
