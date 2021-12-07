# frozen_string_literal: true

require("config")
require("leetcode/lc_17")

module LeetCode
  class TestLC17 < Minitest::Test
    include(LC17)

    [
      ["0", []],
      ["1", []],
      ["2", %w[a b c]],
      ["012", %w[a b c]],
      ["23", %w[ad ae af bd be bf cd ce cf]]
    ].each.with_index { |(digits, expected), i|
      define_method(:"test_letter_combinations_#{i}") {
        assert_equal(expected, letter_combinations(digits).sort)
      }
    }
  end
end
