# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_215")

module LeetCode
  class TestLC215 < Minitest::Test
    include(LC215)

    def test_find_kth_largest_empty
      assert_nil(find_kth_largest([], 1))
    end

    [
      [[0], 1, 0],
      [[0, 1], 1, 1],
      [[0, 1], 2, 0],
      [[0, 1, 1], 1, 1],
      [([0, 1, 2, 3, 4] * 2).shuffle, 1, 4],
      [([0, 1, 2, 3, 4] * 2).shuffle, 3, 3],
      [([0, 1, 2, 3, 4] * 2).shuffle, 5, 2],
      [([0, 1, 2, 3, 4] * 2).shuffle, 7, 1],
      [([0, 1, 2, 3, 4] * 2).shuffle, 9, 0]
    ].each.with_index { |(list, k, expected), i|
      define_method(:"test_find_kth_largest_#{i}") {
        assert_equal(expected, find_kth_largest(list, k))
      }
    }
  end
end
