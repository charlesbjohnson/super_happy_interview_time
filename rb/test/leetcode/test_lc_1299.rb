# frozen_string_literal: true

require("config")
require("leetcode/lc_1299")

module LeetCode
  class TestLC1299 < Minitest::Test
    include(LC1299)

    [
      [[1], [-1]],
      [[1, 2], [2, -1]],
      [[1, 2, 3], [3, 3, -1]],
      [[3, 2, 1], [2, 1, -1]],
      [[17, 18, 5, 4, 6, 1], [18, 6, 6, 6, 1, -1]]
    ].each.with_index { |(arr, expected), i|
      define_method(:"test_replace_elements_#{i}") {
        assert_equal(expected, replace_elements(arr))
      }
    }
  end
end
