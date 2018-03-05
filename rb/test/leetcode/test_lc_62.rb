# frozen_string_literal: true

require 'config'
require 'leetcode/lc_62'

module LeetCode
  class TestLC62 < Minitest::Test
    include LC62

    [
      [0, 0, 0],
      [1, 1, 1],
      [1, 2, 1],
      [2, 1, 1],
      [2, 2, 2],
      [3, 3, 6],
      [4, 4, 20],
      [5, 5, 70]
    ].each.with_index do |(rows, columns, expected), i|
      define_method(:"test_unique_paths_#{i}") do
        assert_equal(expected, unique_paths(rows, columns))
      end
    end
  end
end
