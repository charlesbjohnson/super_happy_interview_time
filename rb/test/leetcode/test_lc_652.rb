# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_652")

module LeetCode
  class TestLC652 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC652)

    [
      [[1, 2, 3, 4, nil, 2, 4, nil, nil, 4], [[2, 4], [4]]],
      [[2, 1, 1], [[1]]],
      [[2, 2, 2, 3, nil, 3, nil], [[2, 3], [3]]],
      [[0, 0, 0, 0, nil, nil, 0], [[0]]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_find_duplicate_subtrees_#{i}") {
        assert_equal(expected.map { |t| build_binary_tree(t) }, find_duplicate_subtrees(build_binary_tree(root)))
      }
    }
  end
end
