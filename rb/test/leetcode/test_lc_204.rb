# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_204")

module LeetCode
  class TestLC204 < Minitest::Test
    include(LC204)

    [
      [0, 0],
      [1, 0],
      [2, 0],
      [3, 1],
      [4, 2],
      [5, 2],
      [6, 3],
      [40, 12]
    ].each.with_index do |(n, expected), i|
      define_method(:"test_count_primes_#{i}") do
        assert_equal(expected, count_primes(n))
      end
    end
  end
end
