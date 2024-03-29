# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_105")

module LeetCode
  class TestLC105 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC105)

    [
      [[[], []], []],
      [[[-1], [-1]], [-1]],
      [[[3, 9, 20, 15, 7], [9, 3, 15, 20, 7]], [3, 9, 20, nil, nil, 15, 7]]
    ].each.with_index { |((preorder, inorder), expected), i|
      define_method(:"test_build_tree_#{i}") {
        expected = build_binary_tree(expected)

        if expected
          assert_equal(expected, build_tree(preorder, inorder))
        else
          assert_nil(build_tree(preorder, inorder))
        end
      }
    }
  end
end
