# frozen_string_literal: true

require 'config'
require 'leetcode/lc_326'

module LeetCode
  class TestLC326 < Minitest::Test
    include LC326

    [
      [0, false],
      [1, true],
      [2, false],
      [3, true],
      [4, false],
      [9, true],
      [9, true],
      [27, true]
    ].each.with_index do |(n, expected), i|
      define_method(:"test_power_of_three?_#{i}") do
        assert_equal(expected, power_of_three?(n))
      end
    end
  end
end
