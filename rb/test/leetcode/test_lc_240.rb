# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_240"

module LeetCode
  class TestLC240 < Minitest::Test
    include LC240

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
          [1, 4, 7, 11, 15],
          [2, 5, 8, 12, 19],
          [3, 6, 9, 16, 22],
          [10, 13, 14, 17, 24],
          [18, 21, 23, 26, 30],
        ],
        5,
        true,
      ],
      [
        [
          [1, 4, 7, 11, 15],
          [2, 5, 8, 12, 19],
          [3, 6, 9, 16, 22],
          [10, 13, 14, 17, 24],
          [18, 21, 23, 26, 30],
        ],
        20,
        false,
      ],
    ].each.with_index do |(matrix, target, expected), i|
      define_method(:"test_search_matrix_#{i}") do
        assert_equal(expected, search_matrix(matrix, target))
      end
    end
  end
end
