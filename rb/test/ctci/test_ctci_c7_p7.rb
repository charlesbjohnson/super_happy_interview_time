# typed: true
# frozen_string_literal: true

require 'config'
require 'ctci/ctci_c7_p7'

module CTCI
  module C7
    class TestP7 < Minitest::Test
      include P7

      def test_returns_kth_number_with_three_five_and_seven_prime_factors_only
        [1, 3, 5, 7, 9, 15, 21, 25, 27, 35, 45, 49, 63].each_with_index do |e, i|
          assert_equal e, kth_number_with_prime_factors(i)
        end
      end

      def test_returns_nil_on_invalid
        assert_nil kth_number_with_prime_factors(-3)
      end
    end
  end
end
