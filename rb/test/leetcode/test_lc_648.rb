# frozen_string_literal: true

require("config")
require("leetcode/lc_648")

module LeetCode
  class TestLC648 < Minitest::Test
    include(LC648)

    [
      [[["cat", "bat", "rat"], "the cattle was rattled by the battery"], "the cat was rat by the bat"],
      [[["a", "b", "c"], "aadsfasf absbs bbab cadsfafs"], "a a b c"],
      [[["a", "aa", "aaa"], "aadsfasf absbs bbab babb"], "a a bbab babb"]
    ].each.with_index { |((dictionary, sentence), expected), i|
      define_method(:"test_replace_words_#{i}") {
        assert_equal(expected, replace_words(dictionary, sentence))
      }
    }
  end
end
