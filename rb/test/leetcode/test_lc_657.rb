# frozen_string_literal: true

require("config")
require("leetcode/lc_657")

module LeetCode
  class TestLC657 < Minitest::Test
    include(LC657)

    [
      ["UD", true],
      ["LL", false]
    ].each.with_index { |(moves, expected), i|
      define_method(:"test_judge_circle_#{i}") {
        assert_equal(expected, judge_circle(moves))
      }
    }
  end
end
