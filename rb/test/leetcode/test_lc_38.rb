# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_38")

module LeetCode
  class TestLC38 < Minitest::Test
    include(LC38)

    [
      [1, "1"],
      [2, "11"],
      [3, "21"],
      [4, "1211"],
      [5, "111221"],
      [6, "312211"]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_count_and_say_#{i}") {
        assert_equal(expected, count_and_say(n))
      }
    }
  end
end
