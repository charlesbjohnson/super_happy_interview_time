# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_125"

module LeetCode
  class TestLC125 < Minitest::Test
    include LC125

    [
      ["", true],
      ["a", true],
      ["ab", false],
      ["aba", true],
      ["A man, a plan, a canal: Panama", true],
      ["racecar a car", false],
    ].each.with_index do |(string, expected), i|
      define_method(:"test_palindrome?_#{i}") do
        assert_equal(expected, palindrome?(string))
      end
    end
  end
end
