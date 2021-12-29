# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_101")

module LeetCode
  class TestLC101 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC101)

    [
      [[0], true],
      [[0, 1], false],
      [[0, 1, 1], true],
      [[1, 2, 2, 3, 4, 4, 3], true],
      [[1, 2, 2, nil, 3, nil, 3], false]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_is_symmetric_#{i}") {
        assert_equal(expected, is_symmetric(build_binary_tree(root)))
      }
    }
  end
end
