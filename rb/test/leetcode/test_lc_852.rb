# frozen_string_literal: true

require("config")
require("leetcode/lc_852")

module LeetCode
  class TestLC852 < Minitest::Test
    include(LC852)

    [
      [[0, 1, 0], 1],
      [[0, 2, 1, 0], 1],
      [[0, 10, 5, 2], 1]
    ].each.with_index { |(arr, expected), i|
      define_method(:"test_peak_index_in_mountain_array_#{i}") {
        assert_equal(expected, peak_index_in_mountain_array(arr))
      }
    }
  end
end
