# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_448'

module LeetCode
  class TestLC448 < Minitest::Test
    include LC448

    [
      [[], []],
      [[1, 3, 4], [2]],
      [[4, 3, 2, 7, 8, 2, 3, 1], [5, 6]]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_find_disappeared_numbers_#{i}") do
        assert_equal(expected, find_disappeared_numbers(list))
      end
    end
  end
end
