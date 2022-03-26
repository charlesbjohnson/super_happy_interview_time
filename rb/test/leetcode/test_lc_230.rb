# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_230")

module LeetCode
  class TestLC230 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC230)

    [
      [[[0], 1], 0],
      [[[1, 0], 1], 0],
      [[[1, 0], 2], 1],
      [[[1, nil, 2], 1], 1],
      [[[1, nil, 2], 2], 2],
      [[[1, 0, 2], 1], 0],
      [[[1, 0, 2], 2], 1],
      [[[1, 0, 2], 3], 2],
      [[[3, 1, 5, 0, 2, 4, 6], 1], 0],
      [[[3, 1, 5, 0, 2, 4, 6], 2], 1],
      [[[3, 1, 5, 0, 2, 4, 6], 3], 2],
      [[[3, 1, 5, 0, 2, 4, 6], 4], 3],
      [[[3, 1, 5, 0, 2, 4, 6], 5], 4],
      [[[3, 1, 5, 0, 2, 4, 6], 6], 5],
      [[[3, 1, 5, 0, 2, 4, 6], 7], 6]
    ].each.with_index { |((root, k), expected), i|
      define_method(:"test_kth_smallest_#{i}") {
        assert_equal(expected, kth_smallest(build_binary_tree(root), k))
      }
    }
  end
end
