# frozen_string_literal: true

require("config")
require("leetcode/lc_905")

module LeetCode
  class TestLC905 < Minitest::Test
    include(LC905)

    [
      [[], []],
      [[0], [0]],
      [[1, 0], [0, 1]],
      [[1, 0, 1], [0, 1, 1]],
      [[3, 1, 2, 4], [4, 2, 1, 3]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_sort_array_by_parity_#{i}") {
        assert_equal(expected, sort_array_by_parity(nums))
      }
    }
  end
end
