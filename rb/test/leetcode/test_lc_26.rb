# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_26"

module LeetCode
  class TestLC26 < Minitest::Test
    include LC26

    [
      [[1, 1], [[1, nil], 1]],
      [[1, 2], [[1, 2], 2]],
      [[1, 1, 2], [[1, 2, nil], 2]],
      [[1, 1, 1, 1, 2, 3, 4], [[1, 2, 3, 4, nil, nil, nil], 4]],
      [[1, 2, 2, 2, 2, 3, 4], [[1, 2, 3, 4, nil, nil, nil], 4]],
      [[1, 2, 3, 4, 4, 4, 4], [[1, 2, 3, 4, nil, nil, nil], 4]],
    ].each.with_index do |(list, (expected, expected_length)), i|
      define_method(:"test_remove_duplicates_#{i}") do
        assert_equal(expected_length, remove_duplicates(list))
        assert_equal(expected, list)
      end
    end
  end
end
