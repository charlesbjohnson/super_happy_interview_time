# frozen_string_literal: true

require("config")
require("helpers/leetcode/union_find")

require("leetcode/lc_323")

module LeetCode
  class TestLC323 < Minitest::Test
    include(LC323)

    [
      [[2, [[0, 1]]], 1],
      [[3, [[0, 1]]], 2],
      [[3, [[0, 1], [2, 0]]], 1],
      [[3, [[0, 1], [2, 1]]], 1],
      [[5, [[0, 1], [1, 2], [3, 4]]], 2],
      [[5, [[0, 1], [1, 2], [2, 3], [3, 4]]], 1]
    ].each.with_index { |((n, edges), expected), i|
      define_method(:"test_count_components_#{i}") {
        assert_equal(expected, count_components(n, edges))
      }
    }
  end
end
