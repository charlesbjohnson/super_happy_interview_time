# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_560"

module LeetCode
  class TestLC560 < Minitest::Test
    include LC560

    [
      [[1], 0, 0],
      [[1], 1, 1],
      [[0], 1, 0],
      [[2], 1, 0],
      [[0, 0], 0, 3],
      [[0, 0, 0], 0, 6],
      [[0] * 1000, 0, 500_500],
      [[1, 1], 1, 2],
      [[1, 1, 1], 1, 3],
      [[1, 1, 1], 2, 2],
      [[1, 1, 1], -1, 0],
      [[-1, -1, -1], -1, 3],
      [[-1, -1, -1], -2, 2],
      [[-1, -1, -1], 1, 0],
      [[1, 2, 3], 1, 1],
      [[1, 2, 3], 2, 1],
      [[1, 2, 3], 3, 2],
      [[1, 2, 3], 4, 0],
      [[1, 2, 3], 5, 1],
      [[1, 2, 3], 6, 1],
      [[1, -1, 1, -1, 1], 0, 6]
    ].each.with_index do |(list, k, expected), i|
      define_method(:"test_subarray_sum_#{i}") do
        assert_equal(expected, subarray_sum(list, k))
      end
    end
  end
end
