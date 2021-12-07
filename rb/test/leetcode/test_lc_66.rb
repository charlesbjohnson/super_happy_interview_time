# frozen_string_literal: true

require("config")
require("leetcode/lc_66")

module LeetCode
  class TestLC66 < Minitest::Test
    include(LC66)

    [
      [[0], [1]],
      [[8], [9]],
      [[9], [1, 0]],
      [[8, 9], [9, 0]],
      [[9, 9], [1, 0, 0]],
      [[9, 8, 9], [9, 9, 0]],
      [[9, 8, 9, 9], [9, 9, 0, 0]]
    ].each.with_index { |(digits, expected), i|
      define_method(:"test_plus_one_#{i}") {
        assert_equal(expected, plus_one(digits))
      }
    }
  end
end
