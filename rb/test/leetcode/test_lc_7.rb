# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_7")

module LeetCode
  class TestLC7 < Minitest::Test
    include(LC7)

    [
      [0, 0],
      [10, 1],
      [123, 321],
      [-123, -321],
      [120, 21],
      [1_534_236_469, 0]
    ].each.with_index { |(x, expected), i|
      define_method(:"test_reverse_#{i}") {
        assert_equal(expected, reverse(x))
      }
    }
  end
end
