# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_287")

module LeetCode
  class TestLC287 < Minitest::Test
    include(LC287)

    [
      [[1, 1, 2, 3], 1],
      [[1, 2, 2, 3], 2],
      [[1, 2, 3, 3], 3],
      [[3, 3, 3, 3], 3],
      [[1, 4, 6, 6, 6, 2, 3], 6]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_find_duplicate_#{i}") do
        assert_equal(expected, find_duplicate(list))
      end
    end
  end
end
