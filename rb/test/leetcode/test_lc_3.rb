# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_3"

module LeetCode
  class TestLC3 < Minitest::Test
    include LC3

    [
      ["", 0],
      ["a", 1],
      ["aa", 1],
      ["abc", 3],
      ["abca", 3],
      ["abcb", 3],
      ["abcadefg", 7],
      ["abcdefcz", 6],
      ["abcdeffabcdeghi", 9],
      ["abcadefgabcdefghijk", 11]
    ].each.with_index do |(s, expected), i|
      define_method(:"test_length_of_longest_substring_#{i}") do
        assert_equal(expected, length_of_longest_substring(s))
      end
    end
  end
end
