# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_450")

module LeetCode
  class TestLC450 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC450)

    [
      [[[], 0], []],
      [[[1], 1], []],
      [[[2], 1], [2]],
      [[[2, 1], 1], [2]],
      [[[2, 1], 2], [1]],
      [[[2, nil, 3], 3], [2]],
      [[[2, nil, 3], 2], [3]],
      [[[2, 1, 3], 2], [3, 1]],
      [[[5, 3, 6, 2, 4, nil, 7], 3], [5, 4, 6, 2, nil, nil, 7]],
      [[[5, 3, 6, 2, 4, nil, 7], 0], [5, 3, 6, 2, 4, nil, 7]]
    ].each.with_index { |((root, key), expected), i|
      define_method(:"test_delete_node_#{i}") {
        root = build_binary_tree(root)
        expected = build_binary_tree(expected)

        if expected
          assert_equal(expected, delete_node(root, key))
        else
          assert_nil(delete_node(root, key))
        end
      }
    }
  end
end
