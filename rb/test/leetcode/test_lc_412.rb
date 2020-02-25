# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_412"

module LeetCode
  class TestLC412 < Minitest::Test
    include LC412

    [
      [0, []],
      [1, ["1"]],
      [3, %w[1 2 Fizz]],
      [5, %w[1 2 Fizz 4 Buzz]],
      [15, %w[1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz]],
    ].each.with_index do |(n, expected), i|
      define_method(:"test_fizz_buzz_#{i}") do
        assert_equal(expected, fizz_buzz(n))
      end
    end
  end
end
