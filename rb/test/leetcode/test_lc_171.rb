# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_171"

module LeetCode
  class TestLC171 < Minitest::Test
    include LC171

    [
      ["A", 1],
      ["B", 2],
      ["C", 3],
      ["Z", 26],
      ["AA", 27],
      ["AB", 28],
    ].each.with_index do |(s, expected), i|
      define_method(:"test_title_to_number_#{i}") do
        assert_equal(expected, title_to_number(s))
      end
    end
  end
end
