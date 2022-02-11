# frozen_string_literal: true

require("config")
require("leetcode/lc_212")

module LeetCode
  class TestLC212 < Minitest::Test
    include(LC212)

    [
      [
        [
          [
            ["a", "b"],
            ["c", "d"]
          ],
          ["abcb"]
        ],
        []
      ],

      [
        [
          [
            ["o", "a", "a", "n"],
            ["e", "t", "a", "e"],
            ["i", "h", "k", "r"],
            ["i", "f", "l", "v"]
          ],
          ["oath", "pea", "eat", "rain"]
        ],
        ["eat", "oath"]
      ]
    ].each.with_index { |((board, words), expected), i|
      define_method(:"test_find_words_#{i}") {
        assert_equal(expected, find_words(board, words).sort)
      }
    }
  end
end
