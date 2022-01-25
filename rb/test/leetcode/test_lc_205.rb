# frozen_string_literal: true

require("config")
require("leetcode/lc_205")

module LeetCode
  class TestLC205 < Minitest::Test
    include(LC205)

    [
      [["egg", "add"], true],
      [["foo", "bar"], false],
      [["food", "baaa"], false],
      [["paper", "title"], true]
    ].each.with_index { |((s, t), expected), i|
      define_method(:"test_is_isomorphic_#{i}") {
        assert_equal(expected, is_isomorphic(s, t))
      }
    }
  end
end
