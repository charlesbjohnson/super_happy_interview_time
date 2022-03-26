# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_113")

module LeetCode
  class TestLC113 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC113)

    [
      [
        [[1, 2], 0],
        []
      ],

      [
        [[1, 2, 3], 5],
        []
      ],

      [
        [[5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, 5, 1], 22],
        [[5, 4, 11, 2], [5, 8, 4, 5]]
      ]
    ].each.with_index { |((root, target_sum), expected), i|
      define_method(:"test_path_sum_#{i}") {
        assert_equal(expected, path_sum(build_binary_tree(root), target_sum))
      }
    }
  end
end
