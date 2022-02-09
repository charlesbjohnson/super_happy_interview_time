# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_700")

module LeetCode
  class TestLC700 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC700)

    [
      [[[2, 1, 3], 1], [1]],
      [[[2, 1, 3], 0], []],
      [[[2, 1, 3], 4], []],
      [[[4, 2, 7, 1, 3], 2], [2, 1, 3]]
    ].each.with_index { |((root, val), expected), i|
      define_method(:"test_search_bst_#{i}") {
        root = build_binary_tree(root)
        expected = build_binary_tree(expected)

        if expected
          assert_equal(expected, search_bst(root, val))
        else
          assert_nil(search_bst(root, val))
        end
      }
    }
  end
end
