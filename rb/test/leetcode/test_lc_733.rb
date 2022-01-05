# frozen_string_literal: true

require("config")
require("leetcode/lc_733")

module LeetCode
  class TestLC733 < Minitest::Test
    include(LC733)

    [
      [
        [
          [
            [1, 1, 1],
            [1, 1, 0],
            [1, 0, 1]
          ],
          1, 1, 2
        ],
        [
          [2, 2, 2],
          [2, 2, 0],
          [2, 0, 1]
        ]
      ],
      [
        [
          [
            [0, 0, 0],
            [0, 0, 0]
          ],
          0, 0, 2
        ],
        [
          [2, 2, 2],
          [2, 2, 2]
        ]
      ]
    ].each.with_index { |((image, sr, sc, new_color), expected), i|
      define_method(:"test_flood_fill_#{i}") {
        assert_equal(expected, flood_fill(image, sr, sc, new_color))
      }
    }
  end
end
