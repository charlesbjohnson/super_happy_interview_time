# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_11")

module LeetCode
  class TestLC11 < Minitest::Test
    include(LC11)

    [
      [[0, 0], 0],
      [[1, 0], 0],
      [[0, 1], 0],
      [[1, 1], 1],
      [[1, 0, 0, 1], 3],
      [[1, 0, 0, 2], 3],
      [[2, 0, 0, 1], 3],
      [[2, 0, 0, 2], 6],
      [[1, 1, 1, 1], 3],
      [[1, 2, 2, 1], 3],
      [[1, 3, 4, 2], 4],
      [[1, 2, 4, 3], 4],
      [[1, 3, 2, 5, 25, 24, 5], 24]
    ].each.with_index do |(heights, expected), i|
      define_method(:"test_max_area_#{i}") do
        assert_equal(expected, max_area(heights))
      end
    end
  end
end
