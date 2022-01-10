# frozen_string_literal: true

require("config")
require("leetcode/lc_344")

module LeetCode
  class TestLC344 < Minitest::Test
    include(LC344)

    [
      [%w[a], %w[a]],
      [%w[a b], %w[b a]],
      [%w[a b c], %w[c b a]],
      [%w[H e l l o], %w[o l l e H]]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_reverse_string_#{i}") {
        reverse_string(s)
        assert_equal(expected, s)
      }
    }
  end
end
