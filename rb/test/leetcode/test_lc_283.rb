# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_283"

module LeetCode
  class TestLC283 < Minitest::Test
    include LC283

    [
      [[], []],
      [[0], [0]],
      [[0, 0], [0, 0]],
      [[0, 1], [1, 0]],
      [[0, 1, 0, 3, 12], [1, 3, 12, 0, 0]]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_move_zeroes_#{i}") do
        move_zeroes(list)
        assert_equal(expected, list)
      end
    end
  end
end
