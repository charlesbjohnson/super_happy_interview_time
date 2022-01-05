# frozen_string_literal: true

require("config")
require("leetcode/lc_20")

module LeetCode
  class TestLC20 < Minitest::Test
    include(LC20)

    [
      ["", true],
      ["()", true],
      ["([])", true],
      ["([{}])", true],
      ["()[]{}", true],
      ["(", false],
      ["(]", false],
      ["([)]", false]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_is_valid_#{i}") {
        assert_equal(expected, is_valid(s))
      }
    }
  end
end
