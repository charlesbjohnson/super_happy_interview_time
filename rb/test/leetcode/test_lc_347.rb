# frozen_string_literal: true

require("config")
require("leetcode/lc_347")

module LeetCode
  class TestLC347 < Minitest::Test
    include(LC347)

    [
      [[[0], 1], [0]],
      [[[0, 1], 2], [0, 1]],
      [[[0, 1, 1], 1], [1]],
      [[[0, 1, 1], 2], [1, 0]],
      [[[1, 1, 1, 2, 2, 3], 2], [1, 2]]
    ].each.with_index { |((nums, k), expected), i|
      define_method(:"test_top_k_frequent_#{i}") {
        assert_equal(expected, top_k_frequent(nums, k))
      }
    }
  end
end
