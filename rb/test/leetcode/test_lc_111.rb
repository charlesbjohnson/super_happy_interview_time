# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_111")

module LeetCode
  class TestLC111 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC111)

    [
      [[], 0],
      [[1], 1],
      [[1, nil, 2], 2],
      [[1, 2, nil], 2],
      [[1, 2, 3], 2],
      [[3, 9, 20, nil, nil, 15, 7], 2],
      [[2, nil, 3, nil, 4, nil, 5, nil, 6], 5]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_min_depth_#{i}") {
        assert_equal(expected, min_depth(build_binary_tree(root)))
      }
    }
  end
end
