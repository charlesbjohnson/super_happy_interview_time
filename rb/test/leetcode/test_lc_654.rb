# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_654")

module LeetCode
  class Test654 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC654)

    [
      [
        [3, 2, 1],
        [3, nil, 2, nil, 1]
      ],

      [
        [3, 2, 1, 6, 0, 5],
        [6, 3, 5, nil, 2, 0, nil, nil, 1]
      ]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_construct_maximum_binary_tree_#{i}") {
        assert_equal(build_binary_tree(expected), construct_maximum_binary_tree(nums))
      }
    }
  end
end
