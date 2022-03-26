# frozen_string_literal: true

require("config")
require("leetcode/lc_152")

module LeetCode
  class TestLC152 < Minitest::Test
    include(LC152)

    [
      [[2, 3, -2, 4], 6],
      [[-2, 0, -1], 0]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_max_product_#{i}") {
        assert_equal(expected, max_product(nums))
      }
    }
  end
end
