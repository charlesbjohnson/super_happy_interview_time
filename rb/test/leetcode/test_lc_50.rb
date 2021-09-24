# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_50")

module LeetCode
  class TestLC50 < Minitest::Test
    include(LC50)

    [
      [0, 0, 1],
      [0, 1, 0],
      [1, 0, 1],
      [1, 1, 1],
      [2, 0, 1],
      [2, 1, 2],
      [2, 2, 4],
      [2, 3, 8],
      [3, 3, 27],
      [1, -1, 1],
      [2, -1, 1.0 / 2],
      [2, -2, 1.0 / 4],
      [3, -3, 1.0 / 27]
    ].each.with_index do |(x, n, expected), i|
      define_method(:"test_my_pow_#{i}") do
        assert_equal(expected, my_pow(x, n))
      end
    end
  end
end
