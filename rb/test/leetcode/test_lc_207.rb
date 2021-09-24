# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_207")

module LeetCode
  class TestLC207 < Minitest::Test
    include(LC207)

    [
      [1, [[0, 0]], false],
      [2, [[1, 0]], true],
      [2, [[1, 0], [0, 1]], false]
    ].each.with_index do |(num_courses, prerequisites, expected), i|
      define_method(:"test_finishable?_#{i}") do
        assert_equal(expected, finishable?(num_courses, prerequisites))
      end
    end
  end
end
