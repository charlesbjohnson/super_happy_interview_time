# frozen_string_literal: true

require("config")
require("helpers/leetcode/union_find")

require("leetcode/lc_261")

module LeetCode
  class TestLC261 < Minitest::Test
    include(LC261)

    [
      [[1, []], true],
      [[2, []], false],
      [[2, [[0, 1]]], true],
      [[2, [[1, 0]]], true],
      [[2, [[1, 0], [0, 1]]], false],
      [[3, [[1, 0], [2, 0]]], true],
      [[5, [[0, 1], [0, 2], [0, 3], [1, 4]]], true],
      [[5, [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]]], false]
    ].each.with_index { |((n, edges), expected), i|
      define_method(:"test_valid_tree_#{i}") {
        assert_equal(expected, valid_tree(n, edges))
      }
    }
  end
end
