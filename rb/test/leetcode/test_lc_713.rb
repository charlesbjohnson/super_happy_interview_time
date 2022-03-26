# frozen_string_literal: true

require("config")
require("leetcode/lc_713")

module LeetCode
  class TestLC713 < Minitest::Test
    include(LC713)

    [
      [[[1, 2, 3], 0], 0],
      [[[10, 5, 2, 6], 100], 8]
    ].each.with_index { |((nums, k), expected), i|
      define_method(:"test_num_subarray_product_less_than_k_#{i}") {
        assert_equal(expected, num_subarray_product_less_than_k(nums, k))
      }
    }
  end
end
