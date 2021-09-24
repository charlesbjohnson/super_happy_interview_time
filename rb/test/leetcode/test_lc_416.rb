# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_416")

module LeetCode
  class TestLC416 < Minitest::Test
    include(LC416)

    [
      [[0], true],
      [[1], false],
      [[1, 5, 11, 5], true],
      [[1, 2, 3, 5], false],
      [[100] * 50, true],
      [[63, 12, 4, 8, 76, 12, 52, 68, 70, 59, 65, 64, 26, 45, 93, 30, 70, 62, 61, 12, 36, 90, 91, 7, 84, 56, 37, 58, 4, 64, 60, 4, 100, 66, 90, 35, 60, 6, 68, 61, 24, 41, 86, 88, 89, 90, 7, 54, 3, 20, 86, 95, 93, 77, 87, 41, 30, 13, 41, 1, 82, 59, 18, 18, 34, 53, 25, 32, 74, 82, 82, 62, 46, 21, 38, 78, 66, 67, 62, 75, 76, 17, 96, 42, 32, 44, 89, 95, 96, 93, 3, 89, 9, 92, 21, 30, 68, 38, 16, 73], true]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_partition?_#{i}") do
        assert_equal(expected, partition?(list))
      end
    end
  end
end
