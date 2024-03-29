# frozen_string_literal: true

require("config")
require("leetcode/lc_28")

module LeetCode
  class TestLC28 < Minitest::Test
    include(LC28)

    [
      ["", "", 0],
      ["", "a", -1],
      ["a", "", 0],
      ["a", "a", 0],
      ["a", "b", -1],
      ["aaa", "aaa", 0],
      ["bbbaa", "aa", 3],
      ["hello", "ll", 2],
      ["aaaaa", "bba", -1],
      ["aaa", "ab", -1],
      ["mississippi", "issip", 4],
      ["mississippi", "pi", 9]
    ].each.with_index { |(haystack, needle, expected), i|
      define_method(:"test_str_str_#{i}") {
        assert_equal(expected, str_str(haystack, needle))
      }
    }
  end
end
