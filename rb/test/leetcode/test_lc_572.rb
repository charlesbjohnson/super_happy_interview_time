# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_572")

module LeetCode
  class TestLC572 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC572)

    [
      [[[0], [0]], true],
      [[[0, 1, 2], [0, 1, nil]], false],
      [[[0, 1, 2], [0, nil, 2]], false],
      [[[0, 1, 2], [0, 1, 2]], true],
      [[[0, 1, 2, 3, 4], [1, 3, 4]], true],
      [[[0, 1, 2, 3, 4, 5, 6], [1, 3, 4]], true],
      [[[0, 1, 2, 3, 4, 5, 6], [2, 5, 6]], true],
      [[[0, 1, 2, 3, 4, 5, 6], [0, 3, 4]], false],
      [[[0, 1, 2, 3], [0, 1, 2]], false],
      [[[3, 4, 5, 1, nil, 2], [3, 1, 2]], false]
    ].each.with_index { |((root, sub_root), expected), i|
      define_method(:"test_is_subtree_#{i}") {
        assert_equal(expected, is_subtree(build_binary_tree(root), build_binary_tree(sub_root)))
      }
    }
  end
end
