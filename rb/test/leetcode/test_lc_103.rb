# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_103")

module LeetCode
  class TestLC103 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC103)

    [
      [[], []],
      [[1], [[1]]],
      [[1, 2, 3, 4, 5], [[1], [3, 2], [4, 5]]],
      [[1, nil, 2, 3], [[1], [2], [3]]],
      [[3, 9, 20, nil, nil, 15, 7], [[3], [20, 9], [15, 7]]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_zigzag_level_order_#{i}") {
        assert_equal(expected, zigzag_level_order(build_binary_tree(root)))
      }
    }
  end
end
