# frozen_string_literal: true

require("config")
require("leetcode/lc_46")

module LeetCode
  class TestLC46 < Minitest::Test
    include(LC46)

    [
      [[1], [[1]]],
      [[0, 1], [[1, 0], [0, 1]]],
      [[0, 1, 2], [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]]]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_permute_#{i}") {
        assert_equal(expected.sort, permute(nums).sort)
      }
    }
  end
end
