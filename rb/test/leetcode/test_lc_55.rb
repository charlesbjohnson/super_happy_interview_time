# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_55")

module LeetCode
  class TestLC55 < Minitest::Test
    include(LC55)

    [
      [[0], true],
      [[1], true],
      [[0, 0], false],
      [[1, 0], true],
      [[2, 0], true],
      [[1, 0, 0], false],
      [[1, 1, 0], true],
      [[2, 0, 0], true],
      [[2, 1, 0], true],
      [[2, 3, 1, 1, 4], true],
      [[3, 2, 1, 0, 4], false],
      [Array.new(2500) { 1 }, true],
      [[2, 5, 0, 0], true],
      [[3, 0, 8, 2, 0, 0, 1], true]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_can_jump_#{i}") do
        assert_equal(expected, can_jump(list))
      end
    end
  end
end
