# frozen_string_literal: true

require("config")
require("leetcode/lc_118")

module LeetCode
  class TestLC118 < Minitest::Test
    include(LC118)

    [
      [0, []],
      [1, [[1]]],
      [2, [[1], [1, 1]]],
      [3, [[1], [1, 1], [1, 2, 1]]],
      [4, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]],
      [5, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_generate_#{i}") {
        assert_equal(expected, generate(n))
      }
    }
  end
end
