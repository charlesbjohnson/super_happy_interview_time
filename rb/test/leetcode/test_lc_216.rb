# frozen_string_literal: true

require("config")
require("leetcode/lc_216")

module LeetCode
  class TestLC216 < Minitest::Test
    include(LC216)

    [
      [[2, 1], []],
      [[1, 1], [[1]]],
      [[2, 3], [[1, 2]]],
      [[3, 7], [[1, 2, 4]]],
      [[3, 9], [[1, 2, 6], [1, 3, 5], [2, 3, 4]]]
    ].each.with_index { |((k, n), expected), i|
      define_method(:"test_combination_sum3_#{i}") {
        assert_equal(expected.sort, combination_sum3(k, n).sort)
      }
    }
  end
end
