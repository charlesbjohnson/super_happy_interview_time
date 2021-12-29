# frozen_string_literal: true

require("config")
require("leetcode/lc_1346")

module LeetCode
  class TestLC1346 < Minitest::Test
    include(LC1346)

    [
      [[], false],
      [[0], false],
      [[1, 2], true],
      [[2, 1], true],
      [[10, 2, 5, 3], true],
      [[7, 1, 14, 11], true],
      [[3, 1, 7, 11], false]
    ].each.with_index { |(arr, expected), i|
      define_method(:"test_check_if_exist_#{i}") {
        assert_equal(expected, check_if_exist(arr))
      }
    }
  end
end
