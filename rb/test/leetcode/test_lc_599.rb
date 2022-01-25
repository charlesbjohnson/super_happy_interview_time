# frozen_string_literal: true

require("config")
require("leetcode/lc_599")

module LeetCode
  class TestLC599 < Minitest::Test
    include(LC599)

    [
      [[%w[a b], %w[a]], %w[a]],
      [[%w[a b], %w[a b]], %w[a]],
      [[%w[a b], %w[b a]], %w[b a]],
      [[%w[a b], %w[c d e b]], %w[b]],
      [[%w[a b], %w[c d]], %w[]]
    ].each.with_index { |((list1, list2), expected), i|
      define_method(:"test_find_restaurant_#{i}") {
        assert_equal(expected, find_restaurant(list1, list2))
      }
    }
  end
end
