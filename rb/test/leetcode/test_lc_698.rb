# frozen_string_literal: true

require("config")
require("leetcode/lc_698")

module LeetCode
  class TestLC698 < Minitest::Test
    include(LC698)

    [
      [[[4, 3, 2, 3, 5, 2, 1], 4], true],
      [[[1, 2, 3, 4], 3], false]
    ].each.with_index { |((nums, k), expected), i|
      define_method(:"test_can_partition_k_subsets_#{i}") {
        assert_equal(expected, can_partition_k_subsets(nums, k))
      }
    }
  end
end
