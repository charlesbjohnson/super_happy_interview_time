# frozen_string_literal: true

require("config")
require("leetcode/lc_421")

module LeetCode
  class TestLC421 < Minitest::Test
    include(LC421)

    [
      [[3, 10, 5, 25, 2, 8], 28],
      [[14, 70, 53, 83, 49, 91, 36, 80, 92, 51, 66, 70], 127]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_find_maximum_xor_#{i}") {
        assert_equal(expected, find_maximum_xor(nums))
      }
    }
  end
end
