# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_647")

module LeetCode
  class TestLC647 < Minitest::Test
    include(LC647)

    [
      ["", 0],
      ["abc", 3],
      ["aaa", 6],
      ["aba", 4]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_count_substrings_#{i}") {
        assert_equal(expected, count_substrings(s))
      }
    }
  end
end
