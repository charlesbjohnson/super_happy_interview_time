# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_268")

module LeetCode
  class TestLC268 < Minitest::Test
    include(LC268)

    [
      [[], 0],
      [[0], 1],
      [[0, 2], 1],
      [[0, 1, 3], 2],
      [[9, 6, 4, 2, 3, 5, 7, 0, 1], 8]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_missing_number_#{i}") {
        assert_equal(expected, missing_number(list))
      }
    }
  end
end
