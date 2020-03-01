# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_387"

module LeetCode
  class TestLC387 < Minitest::Test
    include LC387

    [
      ["", -1],
      ["a", 0],
      ["aa", -1],
      ["aabccd", 2],
      ["leetcode", 0],
      ["loveleetcode", 2]
    ].each.with_index do |(s, expected), i|
      define_method(:"test_first_uniq_char_#{i}") do
        assert_equal(expected, first_uniq_char(s))
      end
    end
  end
end
