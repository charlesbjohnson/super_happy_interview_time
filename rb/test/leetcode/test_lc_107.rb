# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_107")

module LeetCode
  class TestLC107 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC107)

    [
      [[], []],
      [[1], [[1]]],
      [[1, 2, 3, 4, 5], [[4, 5], [2, 3], [1]]],
      [[1, nil, 2, 3], [[3], [2], [1]]],
      [[3, 9, 20, nil, nil, 15, 7], [[15, 7], [9, 20], [3]]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_level_order_bottom_#{i}") {
        assert_equal(expected, level_order_bottom(build_binary_tree(root)))
      }
    }
  end
end
