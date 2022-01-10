# frozen_string_literal: true

require("config")
require("leetcode/lc_27")

module LeetCode
  class TestLC27 < Minitest::Test
    include(LC27)

    [
      [[[], 0], []],
      [[[1], 1], []],
      [[[3, 2, 2, 3], 3], [2, 2]],
      [[[0, 1, 2, 2, 3, 0, 4, 2], 2], [0, 1, 3, 0, 4]]
    ].each.each_with_index { |((nums, val), expected), i|
      define_method(:"test_remove_element_#{i}") {
        assert_equal(expected.length, remove_element(nums, val))
        assert_equal(expected, nums[...expected.length])
      }
    }
  end
end
