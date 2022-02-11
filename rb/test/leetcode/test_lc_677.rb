# frozen_string_literal: true

require("config")
require("leetcode/lc_677")

module LeetCode
  class TestLC677 < Minitest::Test
    include(LC677)

    [
      [
        [:insert, ["foo", 3], nil],
        [:sum, ["b"], 0]
      ],

      [
        [:insert, ["foo", 3], nil],
        [:insert, ["foo", 3], nil],
        [:sum, ["f"], 3]
      ],

      [
        [:insert, ["apple", 3], nil],
        [:sum, ["ap"], 3],
        [:insert, ["app", 2], nil],
        [:sum, ["ap"], 5]
      ]
    ].each.with_index { |steps, i|
      define_method(:"test_map_sum_#{i}") {
        subject = MapSum.new
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
