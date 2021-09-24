# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_136")

module LeetCode
  class TestLC136 < Minitest::Test
    include(LC136)

    [
      [[1], 1],
      [[1, 2, 1], 2],
      [[3, 1, 2, 1, 2], 3]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_single_number_#{i}") do
        assert_equal(expected, single_number(list))
      end
    end
  end
end
