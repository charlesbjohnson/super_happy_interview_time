# frozen_string_literal: true

require("config")
require("leetcode/lc_188")

module LeetCode
  class TestLC188 < Minitest::Test
    include(LC188)

    [
      [[2, [2, 4, 1]], 2],
      [[2, [3, 2, 6, 5, 0, 3]], 7],
      [[2, [3, 3, 5, 0, 0, 3, 1, 4]], 6]
    ].each.with_index { |((k, prices), expected), i|
      define_method(:"test_max_profit_#{i}") {
        assert_equal(expected, max_profit(k, prices))
      }
    }
  end
end
