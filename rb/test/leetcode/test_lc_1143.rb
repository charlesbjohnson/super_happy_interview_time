# frozen_string_literal: true

require("config")
require("leetcode/lc_1143")

module LeetCode
  class TestLC1143 < Minitest::Test
    include(LC1143)

    [
      [["a", "z"], 0],
      [["ab", "ab"], 2],
      [["ab", "ba"], 1],
      [["abc", "abc"], 3],
      [["abc", "def"], 0],
      [["abcde", "ace"], 3],
      [["abcxefg", "abcabcdefg"], 6]
    ].each.with_index { |((text1, text2), expected), i|
      define_method(:"test_longest_common_subsequence_#{i}") {
        assert_equal(expected, longest_common_subsequence(text1, text2))
      }
    }
  end
end
