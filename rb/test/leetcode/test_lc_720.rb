# frozen_string_literal: true

require("config")
require("leetcode/lc_720")

module LeetCode
  class TestLC720 < Minitest::Test
    include(LC720)

    [
      [%w[w wo wor worl world], "world"],
      [%w[a banana app appl ap apply apple], "apple"],
      [%w[m mo moc moch mocha l la lat latt latte c ca cat], "latte"]
    ].each.with_index { |(words, expected), i|
      define_method(:"test_longest_word_#{i}") {
        assert_equal(expected, longest_word(words))
      }
    }
  end
end
