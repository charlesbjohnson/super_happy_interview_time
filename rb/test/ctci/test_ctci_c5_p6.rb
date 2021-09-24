# typed: true
# frozen_string_literal: true

require("config")
require("ctci/ctci_c5_p6")

module CTCI
  module C5
    class TestP6 < Minitest::Test
      include(P6)

      def test_returns_number_with_even_and_odd_bits_swapped
        assert_equal(0b101010, swap_even_odd_bits(0b010101))
        assert_equal(0b1110101110, swap_even_odd_bits(0b1101011101))
      end

      def test_returns_zero_for_zero
        assert_equal(0b0, swap_even_odd_bits(0b0))
      end
    end
  end
end
