# frozen_string_literal: true

require("config")
require("ctci/ctci_c5_p5")

module CTCI
  module C5
    class TestP5 < Minitest::Test
      include(P5)

      def test_returns_difference_in_number_of_bits
        assert_equal(2, bit_difference(31, 14))
      end

      def test_returns_difference_reversed_order
        assert_equal(4, bit_difference(0b00010000,
          0b10110101))
      end

      def test_returns_zero_for_zero
        assert_equal(0, bit_difference(0, 0))
      end
    end
  end
end
