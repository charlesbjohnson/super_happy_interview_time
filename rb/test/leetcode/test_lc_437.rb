# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_437")

module LeetCode
  class TestLC437 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC437)

    [
      [[[], 0], 0],
      [[[0], 0], 1],
      [[[0, 1, 2], 2], 2],
      [[[0, nil, 2], 2], 2],
      [[[0, 1, nil], 1], 2],
      [[[0, 1, 2, 3], 3], 1],
      [[[0, 1, 2, 3, 4, 5, 6], 7], 2],
      [[[0, 1, 2, 3, 4, 5, 6], 5], 3],
      [[[10, 5, -3, 3, 2, nil, 11, 3, -2, nil, 1], 8], 3]
    ].each.with_index { |((root, target_sum), expected), i|
      define_method(:"test_path_sum_#{i}") {
        assert_equal(expected, path_sum(build_binary_tree(root), target_sum))
      }
    }
  end
end
