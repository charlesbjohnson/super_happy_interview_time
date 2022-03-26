# frozen_string_literal: true

require("config")
require("leetcode/lc_784")

module LeetCode
  class TestLC784 < Minitest::Test
    include(LC784)

    [
      ["1", ["1"]],
      ["a", ["a", "A"]],
      ["a1b2", ["a1b2", "a1B2", "A1b2", "A1B2"]],
      ["3z4", ["3z4", "3Z4"]]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_letter_case_permutation_#{i}") {
        assert_equal(expected.sort, letter_case_permutation(s).sort)
      }
    }
  end
end
