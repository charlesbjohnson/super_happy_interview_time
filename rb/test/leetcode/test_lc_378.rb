# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_378")

module LeetCode
  class TestLC378 < Minitest::Test
    include(LC378)

    [
      [
        [
          [
            [-5]
          ],
          1
        ],
        -5
      ],

      [
        [
          [
            [1, 5, 9],
            [10, 11, 13],
            [12, 13, 15]
          ],
          8
        ],
        13
      ],

      [
        [
          [
            [1, 6, 6, 9, 14, 14, 17],
            [5, 8, 9, 9, 14, 17, 18],
            [5, 10, 11, 12, 18, 18, 20],
            [5, 15, 16, 16, 20, 23, 27],
            [7, 15, 19, 21, 22, 24, 31],
            [12, 16, 22, 22, 24, 25, 34],
            [16, 21, 23, 26, 26, 30, 37]
          ],
          45
        ],
        27
      ]
    ].each.with_index { |((matrix, k), expected), i|
      define_method(:"test_kth_smallest_#{i}") {
        assert_equal(expected, kth_smallest(matrix, k))
      }
    }
  end
end
