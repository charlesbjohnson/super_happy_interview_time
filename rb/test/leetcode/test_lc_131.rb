# frozen_string_literal: true

require("config")
require("leetcode/lc_131")

module LeetCode
  class TestLC131 < Minitest::Test
    include(LC131)

    [
      ["a", [["a"]]],
      ["aab", [["a", "a", "b"], ["aa", "b"]]],
      ["abbab", [["a", "b", "b", "a", "b"], ["a", "b", "bab"], ["a", "bb", "a", "b"], ["abba", "b"]]]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_partition_#{i}") {
        assert_equal(expected.sort, partition(s).sort)
      }
    }
  end
end
