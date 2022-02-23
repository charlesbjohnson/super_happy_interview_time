# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_743")

module LeetCode
  class TestLC743 < Minitest::Test
    include(LC743)

    [
      [[[[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2], 2],
      [[[[1, 2, 1]], 2, 1], 1],
      [[[[1, 2, 1]], 2, 2], -1]
    ].each.with_index { |((times, n, k), expected), i|
      define_method(:"test_network_delay_time_#{i}") {
        assert_equal(expected, network_delay_time(times, n, k))
      }
    }
  end
end
