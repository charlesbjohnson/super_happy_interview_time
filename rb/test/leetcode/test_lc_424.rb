# frozen_string_literal: true

require("config")
require("leetcode/lc_424")

module LeetCode
  class TestLC424 < Minitest::Test
    include(LC424)

    [
      [["A", 0], 1],
      [["AB", 0], 1],
      [["AB", 1], 2],
      [["ABAB", 2], 4],
      [["AABABBA", 1], 4]
    ].each.with_index { |((s, k), expected), i|
      define_method(:"test_character_replacement_#{i}") {
        assert_equal(expected, character_replacement(s, k))
      }
    }
  end
end
