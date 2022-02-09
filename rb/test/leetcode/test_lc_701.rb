# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_701")

module LeetCode
  class TestLC701 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC701)

    [
      [[[], 1], [1]],
      [[[1], 2], [1, nil, 2]],
      [[[2], 1], [2, 1]],
      [[[4, 2, 7, 1, 3], 5], [4, 2, 7, 1, 3, 5]],
      [[[40, 20, 60, 10, 30, 50, 70], 25], [40, 20, 60, 10, 30, 50, 70, nil, nil, 25]],
      [[[4, 2, 7, 1, 3, nil, nil, nil, nil, nil, nil], 5], [4, 2, 7, 1, 3, 5]]
    ].each.with_index { |((root, val), expected), i|
      define_method(:"test_insert_into_bst_#{i}") {
        assert_equal(build_binary_tree(expected), insert_into_bst(build_binary_tree(root), val))
      }
    }
  end
end
