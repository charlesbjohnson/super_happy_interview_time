# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_617")

module LeetCode
  class TestLC617 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC617)

    [
      [
        [1],
        [1, 2],
        [2, 2]
      ],
      [
        [-1, nil, 2],
        [1, 2],
        [0, 2, 2]
      ],
      [
        [1, 3, 2, 5],
        [2, 1, 3, nil, 4, nil, 7],
        [3, 4, 5, 5, 4, nil, 7]
      ]
    ].each.with_index { |(root1, root2, expected), i|
      define_method(:"test_merge_trees_#{i}") {
        assert_equal(build_binary_tree(expected), merge_trees(build_binary_tree(root1), build_binary_tree(root2)))
      }
    }
  end
end
