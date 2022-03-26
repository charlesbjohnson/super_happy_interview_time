# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_662")

module LeetCode
  class TestLC662 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC662)

    [
      [[1, 3, 2, 5], 2],
      [[1, 3, 2, 5, 3, nil, 9], 4],
      [[1, 3, 2, 5, nil, nil, 9, 6, nil, 7], 7]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_width_of_binary_tree_#{i}") {
        assert_equal(expected, width_of_binary_tree(build_binary_tree(root)))
      }
    }
  end
end
