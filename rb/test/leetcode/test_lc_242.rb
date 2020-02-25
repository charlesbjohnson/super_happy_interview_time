# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_242"

module LeetCode
  class TestLC242 < Minitest::Test
    include LC242

    [
      ["", "", true],
      ["a", "a", true],
      ["a", "b", false],
      ["anagram", "nagaram", true],
      ["rat", "car", false],
    ].each.with_index do |(substring, string, expected), i|
      define_method(:"test_anagram?_#{i}") do
        assert_equal(expected, anagram?(substring, string))
      end
    end
  end
end
