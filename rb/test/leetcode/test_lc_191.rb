# frozen_string_literal: true

require 'config'
require 'leetcode/lc_191'

module LeetCode
  class TestLC191 < Minitest::Test
    include LC191

    [
      [0, 0],
      [1, 1],
      [2, 1],
      [11, 3]
    ].each.with_index do |(n, expected), i|
      define_method(:"test_hamming_weight_#{i}") do
        assert_equal(expected, hamming_weight(n))
      end
    end
  end
end
