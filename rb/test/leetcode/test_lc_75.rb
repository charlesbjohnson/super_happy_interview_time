# frozen_string_literal: true

require("config")
require("leetcode/lc_75")

module LeetCode
  class TestLC75 < Minitest::Test
    include(LC75)

    [
      [2, 0, 1],
      [2, 0, 2, 1, 1, 0],
      Array.new(10) { Random.random_number(0..2) }
    ].each.with_index { |nums, i|
      define_method(:"test_sort_colors_#{i}") {
        expected = nums.sort
        sort_colors(nums)
        assert_equal(expected, nums)
      }
    }
  end
end
