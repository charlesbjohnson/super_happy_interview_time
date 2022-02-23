# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")
require("helpers/leetcode/union_find")

require("leetcode/lc_1202")

module LeetCode
  class TestLC1202 < Minitest::Test
    include(LC1202)

    [
      [["dcab", [[0, 3], [1, 2]]], "bacd"],
      [["dcab", [[0, 3], [1, 2], [0, 2]]], "abcd"],
      [["cab", [[0, 1], [1, 2]]], "abc"]
    ].each.with_index { |((s, pairs), expected), i|
      define_method(:"test_smallest_string_with_swaps_#{i}") {
        assert_equal(expected, smallest_string_with_swaps(s, pairs))
      }
    }
  end
end
