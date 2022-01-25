# frozen_string_literal: true

require("config")
require("leetcode/lc_202")

module LeetCode
  class TestLC202 < Minitest::Test
    include(LC202)

    [
      [1, true],
      [2, false],
      [3, false],
      [19, true],
      [100, true]
    ].each.with_index { |(n, expected), i|
      define_method(:"test_is_happy_#{i}") {
        assert_equal(expected, is_happy(n))
      }
    }
  end
end
