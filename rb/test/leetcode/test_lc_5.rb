# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_5"

module LeetCode
  class TestLC5 < Minitest::Test
    include LC5

    [
      ["", ""],
      %w[a a],
      %w[cbbd bb],
      %w[babad aba],
      %w[abcdef f],
      ["a" * 1000, "a" * 1000],
      ["#{"a" * 499}bc#{"a" * 499}", "a" * 499]
    ].each.with_index do |(s, expected), i|
      define_method(:"test_longest_palindrome_#{i}") do
        assert_equal(expected, longest_palindrome(s))
      end
    end
  end
end
