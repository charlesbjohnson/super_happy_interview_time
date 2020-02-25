# typed: false
# frozen_string_literal: true

require "config"
require "ctci/ctci_c7_p4"

module CTCI
  module C7
    class TestP4 < Minitest::Test
      # Not entirely sure why I can't do the usual
      # class Integer
      #   include Four
      # end
      # this time...
      Integer.class_eval { include P4 }

      def test_subtracts_from_a_number
        assert_equal 3, 5.subtract(2)
        assert_equal 0, 11.subtract(11)
        assert_equal(-7, 2.subtract(9))
      end

      def test_multiplies_a_number
        assert_equal 6, 3.multiply(2)
        assert_equal 72, 4.multiply(18)
        assert_equal 0, 1.multiply(0)
        assert_equal(-10, 2.multiply(-5))
        assert_equal(-24, -4.multiply(6))
        assert_equal 1, -1.multiply(-1)
      end

      def test_divides_a_number
        assert_equal 6, 12.divide(2)
        assert_equal 20, 100.divide(5)
        assert_equal 2, 30.divide(13)
        assert_equal 0, 4.divide(5)
        assert_equal(-5, -10.divide(2))
        assert_equal(-6, 18.divide(-3))
        assert_equal 9, -27.divide(-3)
        assert_equal 0, 0.divide(3)
        assert_equal 0, 0.divide(-2)
        assert_raises(RuntimeError) { 5.divide(0) }
      end
    end
  end
end
