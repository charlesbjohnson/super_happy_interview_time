# frozen_string_literal: true

require("config")
require("leetcode/lc_1295")

module LeetCode
  class TestLC1295 < Minitest::Test
    include(LC1295)

    [
      [[], 0],
      [[1], 0],
      [[11], 1],
      [[12, 345, 2, 6, 7896], 2],
      [[555, 901, 482, 1771], 1]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_find_numbers_#{i}") {
        assert_equal(expected, find_numbers(nums))
      }
    }
  end
end
