# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_102")

module LeetCode
  class TestLC102 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC102)

    [
      [[], []],
      [[1], [[1]]],
      [[1, 2, 3, 4, 5], [[1], [2, 3], [4, 5]]],
      [[1, nil, 2, 3], [[1], [2], [3]]],
      [[3, 9, 20, nil, nil, 15, 7], [[3], [9, 20], [15, 7]]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_level_order_#{i}") {
        assert_equal(expected, level_order(build_binary_tree(root)))
      }
    }
  end
end
