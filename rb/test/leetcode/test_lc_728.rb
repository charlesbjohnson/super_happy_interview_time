# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_728'

module LeetCode
  class TestLC728 < Minitest::Test
    include LC728

    [
      [10, 11, [11]],
      [1, 22, [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]]
    ].each.with_index do |(left, right, expected), i|
      define_method(:"test_self_dividing_numbers_#{i}") do
        assert_equal(expected, self_dividing_numbers(left, right))
      end
    end
  end
end
