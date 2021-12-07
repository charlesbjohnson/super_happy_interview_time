# frozen_string_literal: true

require("config")
require("leetcode/lc_217")

module LeetCode
  class TestLC217 < Minitest::Test
    include(LC217)

    [
      [[], false],
      [[1], false],
      [[1, 2], false],
      [[1, 1], true]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_contains_duplicate_#{i}") {
        assert_equal(expected, contains_duplicate(list))
      }
    }
  end
end
