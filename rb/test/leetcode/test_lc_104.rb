# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_104")

module LeetCode
  class TestLC104 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC104)

    [
      [[], 0],
      [[1], 1],
      [[1, 2, 3], 2],
      [[3, 9, 20, nil, nil, 15, 7], 3]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_max_depth_#{i}") {
        assert_equal(expected, max_depth(build_binary_tree(root)))
      }
    }
  end
end
