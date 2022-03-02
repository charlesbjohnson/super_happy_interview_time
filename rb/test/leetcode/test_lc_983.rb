# frozen_string_literal: true

require("config")
require("leetcode/lc_983")

module LeetCode
  class TestLC983 < Minitest::Test
    include(LC983)

    [
      [[[1, 4, 6, 7, 8, 20], [2, 7, 15]], 11],
      [[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 30, 31], [2, 7, 15]], 17]
    ].each.with_index { |((days, costs), expected), i|
      define_method(:"test_mincost_tickets_#{i}") {
        assert_equal(expected, mincost_tickets(days, costs))
      }
    }
  end
end
