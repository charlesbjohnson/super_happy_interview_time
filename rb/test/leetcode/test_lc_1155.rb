# frozen_string_literal: true

require("config")
require("leetcode/lc_1155")

module LeetCode
  class TestLC1155 < Minitest::Test
    include(LC1155)

    [
      [[1, 6, 3], 1],
      [[2, 6, 7], 6],
      [[30, 30, 500], 222616187]
    ].each.with_index { |((n, k, target), expected), i|
      define_method(:"test_num_rolls_to_target_#{i}") {
        assert_equal(expected, num_rolls_to_target(n, k, target))
      }
    }
  end
end
