# frozen_string_literal: true

require("config")
require("leetcode/lc_97")

module LeetCode
  class TestLC97 < Minitest::Test
    include(LC97)

    [
      [["", "", ""], true],
      [["aabcc", "dbbca", "aadbbcbcac"], true],
      [["aabcc", "dbbca", "aadbbbaccc"], false],
      [["bbbcc", "bbaccbbbabcacc", "bbbbacbcccbcbabbacc"], false]
    ].each.with_index { |((s1, s2, s3), expected), i|
      define_method(:"test_is_interleave_#{i}") {
        assert_equal(expected, is_interleave(s1, s2, s3))
      }
    }
  end
end
