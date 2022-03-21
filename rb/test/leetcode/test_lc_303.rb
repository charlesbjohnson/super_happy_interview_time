# frozen_string_literal: true

require("config")
require("leetcode/lc_303")

module LeetCode
  class TestLC303 < Minitest::Test
    include(LC303)

    [
      [
        [1],
        [
          [:sum_range, [0, 0], 1]
        ]
      ],

      [
        [1, 2],
        [
          [:sum_range, [0, 0], 1],
          [:sum_range, [1, 1], 2],
          [:sum_range, [0, 1], 3]
        ]
      ],

      [
        [-2, 0, 3, -5, 2, -1],
        [
          [:sum_range, [0, 2], 1],
          [:sum_range, [2, 5], -1],
          [:sum_range, [0, 5], -3]
        ]
      ]
    ].each.with_index { |(nums, steps), i|
      define_method(:"test_num_array_#{i}") {
        subject = NumArray.new(nums)
        steps.each { |method, args, expected|
          assert_equal(expected, subject.send(method, *args))
        }
      }
    }
  end
end
