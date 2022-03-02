# frozen_string_literal: true

require("config")
require("leetcode/lc_276")

module LeetCode
  class TestLC276 < Minitest::Test
    include(LC276)

    [
      [[1, 1], 1],
      [[2, 2], 4],
      [[3, 2], 6],
      [[7, 2], 42]
    ].each.with_index { |((n, k), expected), i|
      define_method(:"test_num_ways_#{i}") {
        assert_equal(expected, num_ways(n, k))
      }
    }
  end
end
