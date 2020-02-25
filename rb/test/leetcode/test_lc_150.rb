# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_150"

module LeetCode
  class TestLC150 < Minitest::Test
    include LC150

    [
      [%w[10], 10],
      [%w[1 2 -], -1],
      [%w[2 1 -], 1],
      [%w[10 2 /], 5],
      [%w[2 10 /], 0],
      [%w[1 2 +], 3],
      [%w[2 1 + 3 *], 9],
      [%w[4 13 5 / +], 6],
      [%w[10 6 9 3 + -11 * / * 17 + 5 +], 22],
    ].each.with_index do |(tokens, expected), i|
      define_method(:"test_eval_rpn_#{i}") do
        assert_equal(expected, eval_rpn(tokens))
      end
    end
  end
end
