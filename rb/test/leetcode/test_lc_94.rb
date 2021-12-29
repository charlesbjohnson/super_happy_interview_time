# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_94")

module LeetCode
  class TestLC94 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC94)

    [
      [[], []],
      [[1], [1]],
      [[1, 2, 3, 4, 5], [4, 2, 5, 1, 3]],
      [[1, nil, 2, 3], [1, 3, 2]],
      [[1, 2, nil, nil, 5], [2, 5, 1]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_inorder_traversal_#{i}") {
        assert_equal(expected, inorder_traversal(build_binary_tree(root)))
      }
    }
  end
end
