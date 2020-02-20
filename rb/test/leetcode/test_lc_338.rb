# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_338'

module LeetCode
  class TestLC338 < Minitest::Test
    include LC338

    [
      [0, [0]],
      [1, [0, 1]],
      [2, [0, 1, 1]],
      [3, [0, 1, 1, 2]],
      [4, [0, 1, 1, 2, 1]],
      [5, [0, 1, 1, 2, 1, 2]],
      [6, [0, 1, 1, 2, 1, 2, 2]],
      [7, [0, 1, 1, 2, 1, 2, 2, 3]],
      [8, [0, 1, 1, 2, 1, 2, 2, 3, 1]],
      [9, [0, 1, 1, 2, 1, 2, 2, 3, 1, 2]],
      [10, [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2]],
      [11, [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3]],
      [12, [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2]],
      [13, [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3]],
      [14, [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3]],
      [15, [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4]]
    ].each.with_index do |(n, expected), i|
      define_method(:"test_count_bits_#{i}") do
        assert_equal(expected, count_bits(n))
      end
    end
  end
end
