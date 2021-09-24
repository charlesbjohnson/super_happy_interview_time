# typed: false
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
    ].each.with_index do |(s, expected), i|
      define_method(:"test_valid?_#{i}") do
        assert_equal(expected, valid?(s))
      end
    end
  end
end
