# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_581"

module LeetCode
  class TestLC581 < Minitest::Test
    include LC581

    [
      [[], 0],
      [[1], 0],
      [[0, 1], 0],
      [[1, 0], 2],
      [[1, 2, 0], 3],
      [[1, 4, 0, 2, 3, 5, 6], 5],
      [[2, 6, 4, 8, 10, 9, 15], 5]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_find_unsorted_subarray_#{i}") do
        assert_equal(expected, find_unsorted_subarray(list))
      end
    end
  end
end
