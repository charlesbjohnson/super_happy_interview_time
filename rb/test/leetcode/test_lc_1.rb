# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_1'

module LeetCode
  class TestLC1 < Minitest::Test
    include LC1

    [
      [[], 0, []],
      [[0, 1], 0, []],
      [[0, 1], 1, [0, 1]],
      [[1, 1], 2, [0, 1]],
      [[0, 1, 2], 2, [0, 2]],
      [[1, 0, 2], 2, [1, 2]],
      [[2, 7, 11, 15], 9, [0, 1]]
    ].each.with_index do |(list, target, expected), i|
      define_method(:"test_two_sum_#{i}") do
        assert_equal(expected, two_sum(list, target))
      end
    end
  end
end
