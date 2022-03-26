# frozen_string_literal: true

require("config")
require("leetcode/lc_5")

module LeetCode
  class TestLC5 < Minitest::Test
    include(LC5)

    [
      %w[a a],
      %w[cbbd bb],
      %w[babad bab],
      %w[abcdef a]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_longest_palindrome_#{i}") {
        assert_equal(expected, longest_palindrome(s))
      }
    }
  end
end
