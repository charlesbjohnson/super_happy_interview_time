# frozen_string_literal: true

require("config")
require("helpers/leetcode/map")

require("leetcode/lc_986")

module LeetCode
  class TestLC986 < Minitest::Test
    include(LC986)

    [
      [
        [
          [[0, 2], [5, 10], [13, 23], [24, 25]],
          [[1, 5], [8, 12], [15, 24], [25, 26]]
        ],
        [[1, 2], [5, 5], [8, 10], [15, 23], [24, 24], [25, 25]]
      ],

      [
        [
          [[1, 3], [5, 9]],
          []
        ],
        []
      ]
    ].each.with_index { |((first_list, second_list), expected), i|
      define_method(:"test_interval_intersection_#{i}") {
        assert_equal(expected, interval_intersection(first_list, second_list))
      }
    }
  end
end
