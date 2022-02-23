# frozen_string_literal: true

require("config")
require("leetcode/lc_310")

module LeetCode
  class TestLC310 < Minitest::Test
    include(LC310)

    [
      [[4, [[1, 0], [1, 2], [1, 3]]], [1]],
      [[6, [[3, 0], [3, 1], [3, 2], [3, 4], [5, 4]]], [3, 4]]
    ].each.with_index { |((n, edges), expected), i|
      define_method(:"test_find_min_height_trees_#{i}") {
        assert_equal(expected, find_min_height_trees(n, edges))
      }
    }
  end
end
