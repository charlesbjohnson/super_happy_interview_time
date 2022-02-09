# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_108")

module LeetCode
  class TestLC108 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC108)

    [
      [[0], [0]],
      [[0, 1], [1, 0]],
      [[0, 1, 2], [1, 0, 2]],
      [[-10, -3, 0, 5, 9], [0, -3, 9, -10, nil, 5]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_sorted_array_to_bst_#{i}") {
        assert_equal(build_binary_tree(expected), sorted_array_to_bst(nums))
      }
    }
  end
end
