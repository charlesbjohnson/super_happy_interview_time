# frozen_string_literal: true

require("config")
require("leetcode/lc_374")

module LeetCode
  class TestLC374 < Minitest::Test
    [
      [1, 1],
      [2, 1],
      [10, 6],
      [100, 23]
    ].each.with_index { |(n, pick), i|
      Class.new(Minitest::Test) {
        include(LC374)

        define_method(:guess) { |v| pick <=> v }

        define_method(:"test_guess_number_#{i}") {
          assert_equal(pick, guess_number(n))
        }
      }
    }
  end
end
