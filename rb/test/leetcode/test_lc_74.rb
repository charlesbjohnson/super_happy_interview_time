# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_74"

module LeetCode
  class TestLC74 < Minitest::Test
    include LC74

    [
      [
        [],
        0,
        false,
      ],
      [
        [[]],
        0,
        false,
      ],
      [
        [
          [1, 2],
          [3, 4],
        ],
        0,
        false,
      ],
      [
        [
          [1, 2],
          [3, 4],
        ],
        5,
        false,
      ],
      [
        [
          [1, 2],
          [3, 4],
        ],
        1,
        true,
      ],
      [
        [
          [1, 2],
          [3, 4],
        ],
        4,
        true,
      ],
      [
        [
          [1, 3, 5, 7],
          [10, 11, 16, 20],
          [23, 30, 34, 50],
        ],
        3,
        true,
      ],
      [
        [
          [1, 3, 5, 7],
          [10, 11, 16, 20],
          [23, 30, 34, 50],
        ],
        15,
        false,
      ],
    ].each.with_index do |(matrix, target, expected), i|
      define_method(:"test_search_matrix_#{i}") do
        assert_equal(expected, search_matrix(matrix, target))
      end
    end
  end
end
