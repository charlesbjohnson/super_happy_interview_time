# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_73"

module LeetCode
  class TestLC73 < Minitest::Test
    include LC73

    [
      [
        [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 0],
        ],
        [
          [1, 2, 0],
          [4, 5, 0],
          [0, 0, 0],
        ],
      ],
      [
        [
          [1, 2, 3],
          [4, 0, 6],
          [7, 8, 9],
        ],
        [
          [1, 0, 3],
          [0, 0, 0],
          [7, 0, 9],
        ],
      ],
      [
        [
          [1, 2, 3],
          [0, 5, 6],
          [7, 8, 9],
        ],
        [
          [0, 2, 3],
          [0, 0, 0],
          [0, 8, 9],
        ],
      ],
      [
        [
          [1, 0, 3],
          [4, 5, 6],
          [7, 8, 9],
        ],
        [
          [0, 0, 0],
          [4, 0, 6],
          [7, 0, 9],
        ],
      ],
      [
        [
          [0, 0, 0, 5],
          [4, 3, 1, 4],
          [0, 1, 1, 4],
          [1, 2, 1, 3],
          [0, 0, 1, 1],
        ],
        [
          [0, 0, 0, 0],
          [0, 0, 0, 4],
          [0, 0, 0, 0],
          [0, 0, 0, 3],
          [0, 0, 0, 0],
        ],
      ],
    ].each.with_index do |(matrix, expected), i|
      define_method(:"test_set_zeroes_#{i}") do
        set_zeroes(matrix)
        assert_equal(expected, matrix)
      end
    end
  end
end
