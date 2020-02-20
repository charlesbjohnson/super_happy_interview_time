# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_771'

module LeetCode
  class TestLC771 < Minitest::Test
    include LC771

    [
      ['aA', 'aAAbbbb', 3],
      ['z', 'ZZ', 0]
    ].each.with_index do |(jewels, stones, expected), i|
      define_method(:"test_num_jewels_in_stones_#{i}") do
        assert_equal(expected, num_jewels_in_stones(jewels, stones))
      end
    end
  end
end
