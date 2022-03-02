# frozen_string_literal: true

require("config")
require("leetcode/lc_139")

module LeetCode
  class TestLC139 < Minitest::Test
    include(LC139)

    [
      [["leetcode", ["leet", "code"]], true],
      [["applepenapple", ["apple", "pen"]], true],
      [["catsandog", ["cats", "dog", "sand", "and", "cat"]], false]
    ].each.with_index { |((s, word_dict), expected), i|
      define_method(:"test_word_break_#{i}") {
        assert_equal(expected, word_break(s, word_dict))
      }
    }
  end
end
