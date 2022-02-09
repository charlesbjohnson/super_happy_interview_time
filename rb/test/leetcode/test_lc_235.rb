# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_235")

module LeetCode
  class TestLC235 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC235)

    [
      [[[2, 1], 2, 1], 2],
      [[[6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5], 2, 8], 6],
      [[[6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5], 2, 4], 2]
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
