# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_236")

module LeetCode
  class TestLC236 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC236)

    [
      [[[1, 2], 1, 2], 1],
      [[[3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4], 5, 1], 3],
      [[[3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4], 5, 4], 5]
    ].each.with_index { |((root, p, q), expected), i|
      define_method(:"test_lowest_common_ancestor_#{i}") {
        root = build_binary_tree(root)
        nodes = levels_binary_tree(root).flatten

        p = nodes.find { |node| node.val == p }
        q = nodes.find { |node| node.val == q }

        expected = nodes.find { |node| node.val == expected }

        assert_equal(expected, lowest_common_ancestor(root, p, q))
      }
    }
  end
end
