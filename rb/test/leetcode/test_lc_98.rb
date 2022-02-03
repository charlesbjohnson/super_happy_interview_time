# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_98")

module LeetCode
  class TestLC98 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC98)

    [
      [[0], true],
      [[1, 0], true],
      [[1, 2], false],
      [[0, 0, 0], false],
      [[1, 0, 2], true],
      [[1, 2, 0], false],
      [[2, 1, 3], true],
      [[1, 2, 3], false],
      [[5, 1, 4, nil, nil, 3, 6], false],
      [[5, 1, 7, nil, nil, 6, 8], true]
    ].each.with_index { |(tree, expected), i|
      define_method(:"test_is_valid_bst_#{i}") {
        assert_equal(expected, is_valid_bst(build_binary_tree(tree)))
      }
    }
  end
end
