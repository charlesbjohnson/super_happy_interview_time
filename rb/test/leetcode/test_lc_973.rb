# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_973")

module LeetCode
  class TestLC973 < Minitest::Test
    include(LC973)

    [
      [[[[1, 3], [-2, 2]], 1], [[-2, 2]]],
      [[[[3, 3], [5, -1], [-2, 4]], 2], [[3, 3], [-2, 4]]]
    ].each.with_index { |((points, k), expected), i|
      define_method(:"test_k_closest_#{i}") {
        assert_equal(expected, k_closest(points, k))
      }
    }
  end
end
