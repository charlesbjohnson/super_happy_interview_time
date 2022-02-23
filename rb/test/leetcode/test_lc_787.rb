# frozen_string_literal: true

require("config")
require("leetcode/lc_787")

module LeetCode
  class TestLC787 < Minitest::Test
    include(LC787)

    [
      [[3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 1], 200],
      [[3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 0], 500]
    ].each.with_index { |((n, flights, src, dst, k), expected), i|
      define_method(:"test_find_cheapest_price_#{i}") {
        assert_equal(expected, find_cheapest_price(n, flights, src, dst, k))
      }
    }
  end
end
