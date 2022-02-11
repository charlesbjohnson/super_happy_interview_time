# frozen_string_literal: true

require("config")
require("leetcode/lc_336")

module LeetCode
  class TestLC336 < Minitest::Test
    include(LC336)

    [
      [["a", ""], [[0, 1], [1, 0]]],
      [["bat", "tab", "cat"], [[0, 1], [1, 0]]],
      [["abcd", "dcba", "lls", "s", "sssll"], [[0, 1], [1, 0], [3, 2], [2, 4]]]
    ].each.with_index { |(words, expected), i|
      define_method(:"test_palindrome_pairs_#{i}") {
        assert_equal(expected.sort, palindrome_pairs(words).sort)
      }
    }
  end
end
