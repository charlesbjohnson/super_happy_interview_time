# typed: true
# frozen_string_literal: true

require "config"
require "ctci/ctci_c1_p7"

module CTCI
  module C1
    class TestP7 < Minitest::Test
      include P7

      def test_rows_with_zero_collapse_to_zero
        m = [[1, 0, 0],
             [0, 2, 0],
             [0, 0, 3],]
        actual = collapse_on_zero(m)
        expected = Array.new(3) { Array.new(3, 0) }

        assert_equal(expected, actual)
      end

      def test_rows_without_zero_dont_collapse_to_zero
        m = [[1, 2],
             [3, 0],
             [4, 5],]
        actual = collapse_on_zero(m)
        expected = [[1, 2],
                    [0, 0],
                    [4, 5],]

        assert_equal(expected, actual)
      end

      def test_returns_empty_array_on_invalid_matrix
        m = [[1],
             [2, 3],
             [4, 5, 6],]
        actual = collapse_on_zero(m)

        assert_equal([], actual)
      end
    end
  end
end
