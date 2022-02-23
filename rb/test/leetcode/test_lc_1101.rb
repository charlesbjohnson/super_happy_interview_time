# frozen_string_literal: true

require("config")
require("helpers/leetcode/union_find")

require("leetcode/lc_1101")

module LeetCode
  class TestLC1101 < Minitest::Test
    include(LC1101)

    [
      [
        [[[20190101, 0, 1], [20190104, 3, 4], [20190107, 2, 3], [20190211, 1, 5], [20190224, 2, 4], [20190301, 0, 3], [20190312, 1, 2], [20190322, 4, 5]], 6],
        20190301
      ],
      [
        [[[0, 2, 0], [1, 0, 1], [3, 0, 3], [4, 1, 2], [7, 3, 1]], 4],
        3
      ]
    ].each.with_index { |((logs, n), expected), i|
      define_method(:"test_earliest_acq_#{i}") {
        assert_equal(expected, earliest_acq(logs, n))
      }
    }
  end
end
