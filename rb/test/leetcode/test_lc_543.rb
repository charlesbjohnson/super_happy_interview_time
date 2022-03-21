# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_543")

module LeetCode
  class TestLC543 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC543)

    [
      [[0], 0],
      [[0, 1, nil], 1],
      [[0, nil, 1], 1],
      [[0, 1, 2], 2],
      [[0, 1, 2, 3, 4, 5, 6], 4],
      [[0, 1, 2, 3, 4, nil, nil], 3]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_diameter_of_binary_tree_#{i}") {
        assert_equal(expected, diameter_of_binary_tree(build_binary_tree(root)))
      }
    }
  end
end
