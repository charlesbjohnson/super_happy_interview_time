# frozen_string_literal: true

require("config")
require("leetcode/lc_207")

module LeetCode
  class TestLC207 < Minitest::Test
    include(LC207)

    [
      [[1, [[0, 0]]], false],
      [[2, [[1, 0]]], true],
      [[2, [[1, 0], [0, 1]]], false],
      [[3, [[1, 0], [2, 1]]], true],
      [[3, [[1, 0], [2, 1], [0, 2]]], false]
    ].each.with_index { |((num_courses, prerequisites), expected), i|
      define_method(:"test_can_finish_#{i}") {
        assert_equal(expected, can_finish(num_courses, prerequisites))
      }
    }
  end
end
