# frozen_string_literal: true

require("config")
require("leetcode/lc_739")

module LeetCode
  class TestLC739 < Minitest::Test
    include(LC739)

    [
      [[], []],
      [[90], [0]],
      [[60, 90], [1, 0]],
      [[90, 60], [0, 0]],
      [[30, 60, 90], [1, 1, 0]],
      [[30, 60, 60, 60, 90], [1, 3, 2, 1, 0]],
      [[30, 40, 50, 60], [1, 1, 1, 0]],
      [[73, 74, 75, 71, 69, 72, 76, 73], [1, 1, 4, 2, 1, 1, 0, 0]]
    ].each.with_index { |(temperatures, expected), i|
      define_method(:"test_daily_temperatures_#{i}") {
        assert_equal(expected, daily_temperatures(temperatures))
      }
    }
  end
end
