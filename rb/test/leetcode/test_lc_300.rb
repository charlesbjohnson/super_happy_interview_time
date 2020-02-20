# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_300'

module LeetCode
  class TestLC300 < Minitest::Test
    include LC300

    [
      [[], 0],
      [[1], 1],
      [[1, 2], 2],
      [[2, 1], 1],
      [[1, 2, 3, 4, 5], 5],
      [[3, 5, 4, 1, 2], 2],
      [[2, 4, 3, 5, 1], 3],
      [[3, 4, -1, 0, 6, 2, 3], 4]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_length_of_lis_#{i}") do
        assert_equal(expected, length_of_lis(list))
      end
    end
  end
end
