# frozen_string_literal: true

require("config")
require("leetcode/lc_1335")

module LeetCode
  class TestLC1335 < Minitest::Test
    include(LC1335)

    [
      [[[6, 5, 4, 3, 2, 1], 2], 7],
      [[[9, 9, 9], 4], -1],
      [[[1, 1, 1], 3], 3],
      [[[11, 111, 22, 222, 33, 333, 44, 444], 6], 843]
    ].each.with_index { |((job_difficulty, d), expected), i|
      define_method(:"test_min_difficulty_#{i}") {
        assert_equal(expected, min_difficulty(job_difficulty, d))
      }
    }
  end
end
