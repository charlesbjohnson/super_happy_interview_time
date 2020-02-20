# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_190'

module LeetCode
  class TestLC190 < Minitest::Test
    include LC190

    [
      [0, 0],
      [1, 2_147_483_648],
      [43_261_596, 964_176_192]
    ].each.with_index do |(n, expected), i|
      define_method(:"test_reverse_bits_#{i}") do
        assert_equal(expected, reverse_bits(n))
      end
    end
  end
end
