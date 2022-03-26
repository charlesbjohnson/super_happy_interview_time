# frozen_string_literal: true

require("config")
require("leetcode/lc_22")

module LeetCode
  class TestLC22 < Minitest::Test
    include(LC22)

    [
      [1, %w[()]],
      [2, %w[(()) ()()]],
      [3, %w[((())) (()()) (())() ()(()) ()()()]]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_generate_parenthesis_#{i}") {
        assert_equal(expected.sort, generate_parenthesis(n).sort)
      }
    }
  end
end
