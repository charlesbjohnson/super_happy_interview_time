# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_199")

module LeetCode
  class TestLC199 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC199)

    [
      [[], []],
      [[1], [1]],
      [[1, 2], [1, 2]],
      [[1, nil, 3], [1, 3]],
      [[1, 2, 3, nil, 5, nil, 4], [1, 3, 4]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_right_side_view_#{i}") {
        assert_equal(expected, right_side_view(build_binary_tree(root)))
      }
    }
  end
end
