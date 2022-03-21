# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_226")

module LeetCode
  class TestLC226 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC226)

    [
      [[], []],
      [[0], [0]],
      [[0, 1, nil], [0, nil, 1]],
      [[0, nil, 1], [0, 1, nil]],
      [[4, 2, 7, 1, 3, 6, 9], [4, 7, 2, 9, 6, 3, 1]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_invert_tree_#{i}") {
        root = build_binary_tree(root)
        expected = build_binary_tree(expected)

        if expected
          assert_equal(expected, invert_tree(root))
        else
          assert_nil(invert_tree(root))
        end
      }
    }
  end
end
