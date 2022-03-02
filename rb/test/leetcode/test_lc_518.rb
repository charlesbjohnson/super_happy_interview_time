# frozen_string_literal: true

require("config")
require("leetcode/lc_518")

module LeetCode
  class TestLC518 < Minitest::Test
    include(LC518)

    [
      [[0, [1]], 1],
      [[3, [2]], 0],
      [[10, [1]], 1],
      [[10, [10]], 1],
      [[2, [1, 2]], 2],
      [[2, [1, 2, 3]], 2],
      [[5, [1, 2, 5]], 4]
    ].each.with_index { |((amount, coins), expected), i|
      define_method(:"test_change_#{i}") {
        assert_equal(expected, change(amount, coins))
      }
    }
  end
end
