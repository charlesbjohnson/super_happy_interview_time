# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_70")

module LeetCode
  class TestLC70 < Minitest::Test
    include(LC70)

    [
      [1, 1],
      [2, 2],
      [3, 3],
      [4, 5]
    ].each.with_index do |(n, expected), i|
      define_method(:"test_climb_stairs_#{i}") do
        assert_equal(expected, climb_stairs(n))
      end
    end
  end
end
