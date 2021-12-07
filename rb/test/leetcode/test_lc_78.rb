# frozen_string_literal: true

require("config")
require("leetcode/lc_78")

module LeetCode
  class TestLC78 < Minitest::Test
    include(LC78)

    [
      [[], [[]]],
      [[0], [[], [0]]],
      [[0, 1], [[], [0], [1], [0, 1]]],
      [[0, 1, 2], [[], [0], [1], [2], [0, 1], [0, 2], [1, 2], [0, 1, 2]]]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_subsets_#{i}") {
        assert_equal(expected.sort, subsets(list).sort)
      }
    }
  end
end
