# frozen_string_literal: true

require("config")
require("leetcode/lc_1473")

module LeetCode
  class TestLC1473 < Minitest::Test
    include(LC1473)

    [
      [
        [
          [0, 0, 0, 0, 0],
          [[1, 10], [10, 1], [10, 1], [1, 10], [5, 1]],
          3
        ],
        9
      ],

      [
        [
          [0, 2, 1, 2, 0],
          [[1, 10], [10, 1], [10, 1], [1, 10], [5, 1]],
          3
        ],
        11
      ],

      [
        [
          [3, 1, 2, 3],
          [[1, 1, 1], [1, 1, 1], [1, 1, 1], [1, 1, 1]],
          3
        ],
        -1
      ]
    ].each.with_index { |((houses, cost, target), expected), i|
      define_method(:"test_min_cost_#{i}") {
        assert_equal(expected, min_cost(houses, cost, houses.length, cost[0].length, target))
      }
    }
  end
end
