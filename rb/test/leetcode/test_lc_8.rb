# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_8")

module LeetCode
  class TestLC8 < Minitest::Test
    include(LC8)

    [
      ["", 0],
      ["0", 0],
      ["f0", 0],
      ["1", 1],
      ["   1", 1],
      ["-1", -1],
      ["+1", 1],
      ["+-1", 0],
      ["-123a4", -123],
      ["10", 10],
      ["100", 100],
      ["1234", 1234],
      ["3000000000", 2_147_483_647],
      ["-3000000000", -2_147_483_648]
    ].each.with_index do |(string, expected), i|
      define_method(:"test_my_atoi_#{i}") do
        assert_equal(expected, my_atoi(string))
      end
    end
  end
end
