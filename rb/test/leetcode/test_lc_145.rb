# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_145")

module LeetCode
  class TestLC145 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC145)

    [
      [[], []],
      [[1], [1]],
      [[1, 2, 3, 4, 5], [4, 5, 2, 3, 1]],
      [[1, nil, 2, 3], [3, 2, 1]],
      [[1, 2, nil, nil, 5], [5, 2, 1]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_postorder_traversal_#{i}") {
        assert_equal(expected, postorder_traversal(build_binary_tree(root)))
      }
    }
  end
end
