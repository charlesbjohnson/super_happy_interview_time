# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_100")

module LeetCode
  class TestLC100 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC100)

    [
      [[[], []], true],
      [[[1], []], false],
      [[[], [1]], false],
      [[[1], [1]], true],
      [[[1], [2]], false],
      [[[1, 2, 3], [1, 2, 3]], true],
      [[[1, 2], [1, nil, 2]], false],
      [[[1, 2, 1], [1, 1, 2]], false]
    ].each.with_index { |((p, q), expected), i|
      define_method(:"test_is_same_tree_#{i}") {
        assert_equal(expected, is_same_tree(build_binary_tree(p), build_binary_tree(q)))
      }
    }
  end
end
