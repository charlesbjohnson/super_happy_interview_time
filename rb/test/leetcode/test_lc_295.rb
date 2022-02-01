# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_295")

module LeetCode
  class TestLC295 < Minitest::Test
    include(LC295)

    [
      [
        [:add_num, [1], nil],
        [:find_median, [], 1.0],
        [:add_num, [2], nil],
        [:find_median, [], 1.5],
        [:add_num, [3], nil],
        [:find_median, [], 2.0]
      ],

      [
        [:add_num, [100], nil],
        [:find_median, [], 100.0],
        [:add_num, [53], nil],
        [:find_median, [], 76.5],
        [:add_num, [59], nil],
        [:find_median, [], 59.0],
        [:add_num, [96], nil],
        [:find_median, [], 77.5],
        [:add_num, [27], nil],
        [:find_median, [], 59.0]
      ]
    ].each.with_index { |steps, i|
      define_method(:"test_median_finder_#{i}") {
        subject = MedianFinder.new
        steps.each { |method, args, expected|
          if expected
            assert_equal(expected, subject.send(method, *args))
          else
            assert_nil(subject.send(method, *args))
          end
        }
      }
    }
  end
end
