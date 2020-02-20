# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_344'

module LeetCode
  class TestLC344 < Minitest::Test
    include LC344

    [
      %w[a a],
      %w[ab ba],
      %w[foobar raboof],
      %w[hello olleh]
    ].each.with_index do |(s, expected), i|
      define_method(:"test_reverse_string_#{i}") do
        assert_equal(expected, reverse_string(s))
      end
    end
  end
end
