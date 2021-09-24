# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_763")

module LeetCode
  class TestLC763 < Minitest::Test
    include(LC763)

    [
      ["a", [1]],
      ["ab", [1, 1]],
      ["aab", [2, 1]],
      ["abb", [1, 2]],
      ["aaabbb", [3, 3]],
      ["abbba", [5]],
      ["qiejxqfnqceocmy", [13, 1, 1]],
      ["ababcbacadefegdehijhklij", [9, 7, 8]]
    ].each.with_index do |(s, expected), i|
      define_method(:"test_partition_labels_#{i}") do
        assert_equal(expected, partition_labels(s))
      end
    end
  end
end
