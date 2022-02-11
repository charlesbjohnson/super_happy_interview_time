# frozen_string_literal: true

require("config")
require("leetcode/lc_425")

module LeetCode
  class TestLC425 < Minitest::Test
    include(LC425)

    [
      [["area", "lead", "wall", "lady", "ball"], [["ball", "area", "lead", "lady"], ["wall", "area", "lead", "lady"]]],
      [["abat", "baba", "atan", "atal"], [["baba", "abat", "baba", "atal"], ["baba", "abat", "baba", "atan"]]]
    ].each.with_index { |(words, expected), i|
      define_method(:"test_word_squares_#{i}") {
        assert_equal(expected.sort, word_squares(words).sort)
      }
    }
  end
end
