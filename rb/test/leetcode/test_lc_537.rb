# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_537'

module LeetCode
  class TestLC537 < Minitest::Test
    include LC537

    [
      ['1+1i', '1+1i', '0+2i'],
      ['1+-1i', '1+-1i', '0+-2i']
    ].each.with_index do |(left, right, expected), i|
      define_method(:"test_complex_number_multiply_#{i}") do
        assert_equal(expected, complex_number_multiply(left, right))
      end
    end
  end
end
