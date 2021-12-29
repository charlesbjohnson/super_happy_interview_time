# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_106")

module LeetCode
  class TestLC106 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC106)

    [
      [[[], []], []],
      [[[-1], [-1]], [-1]],
      [[[9, 3, 15, 20, 7], [9, 15, 7, 20, 3]], [3, 9, 20, nil, nil, 15, 7]]
    ].each.with_index { |((inorder, postorder), expected), i|
      define_method(:"test_build_tree_#{i}") {
        expected = build_binary_tree(expected)

        if expected
          assert_equal(expected, build_tree(inorder, postorder))
        else
          assert_nil(build_tree(inorder, postorder))
        end
      }
    }
  end
end
