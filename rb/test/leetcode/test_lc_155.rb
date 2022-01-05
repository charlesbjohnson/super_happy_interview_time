# frozen_string_literal: true

require("config")
require("leetcode/lc_155")

module LeetCode
  class TestLC155 < Minitest::Test
    include(LC155)

    [
      [
        [:push, [-2], nil],
        [:push, [0], nil],
        [:push, [-3], nil],
        [:get_min, [], -3],
        [:pop, [], nil],
        [:top, [], 0],
        [:get_min, [], -2]
      ]
    ].each.with_index { |steps, i|
      define_method(:"test_min_stack_#{i}") {
        subject = MinStack.new
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
