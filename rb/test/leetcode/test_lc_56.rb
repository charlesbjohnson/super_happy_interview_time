# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_56")

module LeetCode
  class TestLC56 < Minitest::Test
    include(LC56)

    def build(intervals)
      intervals.map { |interval| Interval.new(interval[0], interval[1]) }
    end

    [
      [[], []],
      [[[1, 10]], [[1, 10]]],
      [[[0, 10], [5, 7]], [[0, 10]]],
      [[[0, 10], [0, 15]], [[0, 15]]],
      [[[0, 10], [5, 15]], [[0, 15]]],
      [[[0, 10], [5, 15], [14, 20]], [[0, 20]]],
      [[[0, 10], [11, 20], [15, 30]], [[0, 10], [11, 30]]],
      [[[1, 3], [2, 6], [8, 10], [15, 18]], [[1, 6], [8, 10], [15, 18]]]
    ].each.with_index do |(intervals, expected), i|
      define_method(:"test_merge_#{i}") do
        assert_equal(build(expected), merge(build(intervals)))
      end
    end
  end
end
