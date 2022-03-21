# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_637")

module LeetCode
  class TestLC637 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC637)

    [
      [[3], [3.0]],
      [[3, 4, nil], [3.0, 4.0]],
      [[3, nil, 5], [3.0, 5.0]],
      [[3, 4, 5], [3.0, 4.5]],
      [[3, 9, 20, nil, nil, 15, 7], [3.0, 14.5, 11.0]],
      [[3, 9, 20, 15, 7], [3.0, 14.5, 11.0]]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_average_of_levels_#{i}") {
        assert_equal(expected, average_of_levels(build_binary_tree(root)))
      }
    }
  end
end
