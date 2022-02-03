# frozen_string_literal: true

require("config")
require("leetcode/lc_779")

module LeetCode
  class TestLC779 < Minitest::Test
    include(LC779)

    [
      [[1, 1], 0],
      [[2, 1], 0],
      [[2, 2], 1],
      [[3, 1], 0],
      [[3, 2], 1],
      [[3, 3], 1],
      [[3, 4], 0]
    ].each.with_index { |((n, k), expected), i|
      define_method(:"test_kth_grammar_#{i}") {
        assert_equal(expected, kth_grammar(n, k))
      }
    }
  end
end
