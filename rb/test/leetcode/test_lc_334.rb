# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_334")

module LeetCode
  class TestLC334 < Minitest::Test
    include(LC334)

    [
      [[], false],
      [[1, 2, 3], true],
      [[1, 1, 1], false],
      [[5, 4, 3], false],
      [[0, 1, -1, 0, 2], true],
      [[1, 0, 2, -1, 3], true]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_increasing_triplet_#{i}") {
        assert_equal(expected, increasing_triplet(list))
      }
    }
  end
end

# 0 1 -1 0 1
