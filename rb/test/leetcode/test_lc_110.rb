# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_110")

module LeetCode
  class TestLC110 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC110)

    [
      [[], true],
      [[0], true],
      [[2, 1, 3], true],
      [[2, 1], true],
      [[2, nil, 3], true],
      [[2, 1, nil, 0], false],
      [[2, nil, 3, nil, 5], false],
      [[3, 9, 20, nil, nil, 15, 7], true],
      [[1, 2, 2, 3, 3, nil, nil, 4, 4], false]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_is_balanced_#{i}") {
        assert_equal(expected, is_balanced(build_binary_tree(root)))
      }
    }
  end
end
