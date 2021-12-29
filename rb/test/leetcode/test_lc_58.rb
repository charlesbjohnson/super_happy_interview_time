# frozen_string_literal: true

require("config")
require("leetcode/lc_58")

module LeetCode
  class TestLC58 < Minitest::Test
    include(LC58)

    [
      ["Hello World", 5],
      ["   fly me   to   the moon  ", 4],
      ["luffy is still joyboy", 6]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_length_of_last_word_#{i}") {
        assert_equal(expected, length_of_last_word(s))
      }
    }
  end
end
