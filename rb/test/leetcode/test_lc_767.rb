# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_767")

module LeetCode
  class TestLC767 < Minitest::Test
    include(LC767)

    [
      ["aab", "aba"],
      ["aaab", ""]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_reorganize_string_#{i}") {
        assert_equal(expected, reorganize_string(s))
      }
    }
  end
end
