# frozen_string_literal: true

require("config")
require("leetcode/lc_77")

module LeetCode
  class TestLC77 < Minitest::Test
    include(LC77)

    [
      [[1, 1], [[1]]],
      [[2, 1], [[1], [2]]],
      [[2, 2], [[1, 2]]],
      [[3, 2], [[1, 2], [1, 3], [2, 3]]],
      [[4, 2], [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]]
    ].each.with_index { |((n, k), expected), i|
      define_method(:"test_combine_#{i}") {
        assert_equal(expected, combine(n, k))
      }
    }
  end
end
