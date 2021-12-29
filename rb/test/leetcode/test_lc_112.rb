# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_112")

module LeetCode
  class TestLC112 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC112)

    [
      [[[], 0], false],
      [[[1], 1], true],
      [[[0], 1], false],
      [[[1, nil, 2], 1], false],
      [[[1, nil, 2], 3], true],
      [[[5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1], 22], true],
      [[[1, 2, 3], 5], false]
    ].each.with_index { |((root, target_sum), expected), i|
      define_method(:"test_has_path_sum_#{i}") {
        assert_equal(expected, has_path_sum(build_binary_tree(root), target_sum))
      }
    }
  end
end
