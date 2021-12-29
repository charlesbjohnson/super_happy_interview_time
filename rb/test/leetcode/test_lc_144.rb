# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_144")

module LeetCode
  class TestLC144 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC144)

    [
      [[], []],
      [[1], [1]],
      [[1, 2, 3, 4, 5], [1, 2, 4, 5, 3]],
      [[1, nil, 2, 3], [1, 2, 3]],
      [[1, 2, nil, nil, 5], [1, 2, 5]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_preorder_traversal_#{i}") {
        assert_equal(expected, preorder_traversal(build_binary_tree(root)))
      }
    }
  end
end
