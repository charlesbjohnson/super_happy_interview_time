# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_1337")

module LeetCode
  class TestLC1337 < Minitest::Test
    include(LC1337)

    [
      [
        [
          [
            [1, 0, 0, 0],
            [1, 1, 1, 1],
            [1, 0, 0, 0],
            [1, 0, 0, 0]
          ],
          2
        ],
        [0, 2]
      ],

      [
        [
          [
            [1, 1, 0, 0, 0],
            [1, 1, 1, 1, 0],
            [1, 0, 0, 0, 0],
            [1, 1, 0, 0, 0],
            [1, 1, 1, 1, 1]
          ],
          3
        ],
        [2, 0, 3]
      ]
    ].each.with_index { |((mat, k), expected), i|
      define_method(:"test_k_weakest_rows_#{i}") {
        assert_equal(expected, k_weakest_rows(mat, k))
      }
    }
  end
end
