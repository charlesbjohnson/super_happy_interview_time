# frozen_string_literal: true

require("config")
require("leetcode/lc_9")

module LeetCode
  class TestLC9 < Minitest::Test
    include(LC9)

    [
      [121, true],
      [-121, false],
      [10, false],
      [-101, false]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_palindrome?_#{i}") {
        assert_equal(expected, palindrome?(n))
      }
    }
  end
end
