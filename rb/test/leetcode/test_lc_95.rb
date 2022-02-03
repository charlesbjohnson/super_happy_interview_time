# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_95")

module LeetCode
  class TestLC95 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC95)

    [
      [1, [[1]]],
      [2, [[1, nil, 2], [2, 1]]],
      [3, [[1, nil, 2, nil, 3], [1, nil, 3, 2], [2, 1, 3], [3, 1, nil, nil, 2], [3, 2, nil, 1]]]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_generate_trees_#{i}") {
        assert_equal(expected.map { |root| build_binary_tree(root) }, generate_trees(n))
      }
    }
  end
end
