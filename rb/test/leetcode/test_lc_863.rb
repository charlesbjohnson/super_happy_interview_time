# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_863")

module LeetCode
  class TestLC863 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC863)

    [
      [[[1], 1, 3], []],
      [[[3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4], 5, 2], [7, 4, 1]]
    ].each.with_index { |((root, target, k), expected), i|
      define_method(:"test_distance_k_#{i}") {
        assert_equal(expected.sort, distance_k(build_binary_tree(root), TreeNode.new(target), k).sort)
      }
    }
  end
end
