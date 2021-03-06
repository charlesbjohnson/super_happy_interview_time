# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_33"

module LeetCode
  class TestLC33 < Minitest::Test
    include LC33

    [
      [[], 0, -1],
      [[0], 0, 0],
      [[0], 1, -1],
      [[0, 1, 2], 1, 1],
      [[0, 1, 2], 0, 0],
      [[0, 1, 2], 2, 2],
      [[2, 0, 1], 0, 1],
      [[2, 0, 1], 2, 0],
      [[2, 0, 1], 1, 2],
      [[1, 2, 0], 2, 1],
      [[1, 2, 0], 1, 0],
      [[1, 2, 0], 0, 2],
      [[1, 2, 0], -1, -1],
      [[2, 3, 4, 5, 1], 5, 3],
      [[5, 4, 1, 2, 3], 4, 1],
      [[5, 1, 2, 3, 4], 1, 1],
      [[3, 4, 5, 1, 2], 1, 3],
      [[4, 5, 6, 7, 8, 1, 2, 3], 8, 4]
    ].each.with_index do |(list, target, expected), i|
      define_method(:"test_search_#{i}") do
        assert_equal(expected, search(list, target))
      end
    end
  end
end
