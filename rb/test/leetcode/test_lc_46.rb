# frozen_string_literal: true

require("config")
require("leetcode/lc_46")

module LeetCode
  class TestLC46 < Minitest::Test
    include(LC46)

    [
      [[], [[]]],
      [[1], [[1]]],
      [[1, 2], [[2, 1], [1, 2]]],
      [[1, 2, 3], [[3, 2, 1], [2, 3, 1], [2, 1, 3], [3, 1, 2], [1, 3, 2], [1, 2, 3]]]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_permute_#{i}") {
        assert_equal(expected.sort, permute(list).sort)
      }
    }
  end
end
