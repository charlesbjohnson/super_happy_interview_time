# frozen_string_literal: true

require("config")
require("leetcode/lc_557")

module LeetCode
  class TestLC557 < Minitest::Test
    include(LC557)

    [
      ["Let's take LeetCode contest", "s'teL ekat edoCteeL tsetnoc"],
      ["God Ding", "doG gniD"]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_reverse_words_#{i}") {
        assert_equal(expected, reverse_words(String.new(s)))
      }
    }
  end
end
