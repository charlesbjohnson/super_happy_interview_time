# frozen_string_literal: true

require("config")
require("leetcode/lc_416")

module LeetCode
  class TestLC416 < Minitest::Test
    include(LC416)

    [
      [[0], true],
      [[1], false],
      [[1, 3, 4], true],
      [[1, 2, 1, 2], true],
      [[1, 5, 11, 5], true],
      [[1, 2, 3, 5], false]
    ].each.with_index { |(nums, expected), i|
      define_method(:"test_can_partition_#{i}") {
        assert_equal(expected, can_partition(nums))
      }
    }
  end
end
