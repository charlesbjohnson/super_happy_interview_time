# frozen_string_literal: true

require("config")
require("leetcode/lc_844")

module LeetCode
  class TestLC844 < Minitest::Test
    include(LC844)

    [
      [["ab#c", "ad#c"], true],
      [["ab##", "c#d#"], true],
      [["a#c", "b"], false],
      [["a##cab##", "a##c"], true],
      [["bxj##tw", "bxo#j##tw"], true]
    ].each.with_index { |((s, t), expected), i|
      define_method(:"test_backspace_compare_#{i}") {
        assert_equal(expected, backspace_compare(s, t))
      }
    }
  end
end
