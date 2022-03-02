# frozen_string_literal: true

require("config")
require("leetcode/lc_1220")

module LeetCode
  class TestLC1220 < Minitest::Test
    include(LC1220)

    [
      [1, 5],
      [2, 10],
      [5, 68]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_count_vowel_permutation_#{i}") {
        assert_equal(expected, count_vowel_permutation(n))
      }
    }
  end
end
