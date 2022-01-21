# frozen_string_literal: true

require("config")
require("leetcode/lc_704")

module LeetCode
  class TestLC704 < Minitest::Test
    include(LC704)

    [
      [[[-1, 0, 3, 5, 9, 12], 9], 4],
      [[[-1, 0, 3, 5, 9, 12], 2], -1]
    ].each.with_index { |((nums, target), expected), i|
      define_method(:"test_search_#{i}") {
        assert_equal(expected, search(nums, target))
      }
    }
  end
end
