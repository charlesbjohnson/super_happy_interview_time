# frozen_string_literal: true

require("config")
require("leetcode/lc_151")

module LeetCode
  class TestLC151 < Minitest::Test
    include(LC151)

    [
      ["the sky is blue", "blue is sky the"],
      ["  hello world  ", "world hello"],
      ["a good   example", "example good a"]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_reverse_words_#{i}") {
        assert_equal(expected, reverse_words(String.new(s)))
      }
    }
  end
end
