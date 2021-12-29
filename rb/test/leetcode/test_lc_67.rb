# frozen_string_literal: true

require("config")
require("leetcode/lc_67")

module LeetCode
  class TestLC67 < Minitest::Test
    include(LC67)

    [
      ["11", "1", "100"],
      ["1010", "1011", "10101"]
    ].each.with_index { |(a, b, expected), i|
      define_method(:"test_add_binary_#{i}") {
        assert_equal(expected, add_binary(a, b))
      }
    }
  end
end
