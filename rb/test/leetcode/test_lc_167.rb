# frozen_string_literal: true

require("config")
require("leetcode/lc_167")

module LeetCode
  class TestLC167 < Minitest::Test
    include(LC167)

    [
      [[[2, 7, 11, 15], 9], [1, 2]],
      [[[2, 3, 4], 6], [1, 3]],
      [[[-1, 0], -1], [1, 2]]
    ].each.with_index { |((numbers, target), expected), i|
      define_method(:"test_two_sum_#{i}") {
        assert_equal(expected, two_sum(numbers, target))
      }
    }
  end
end
