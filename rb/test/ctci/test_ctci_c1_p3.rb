# frozen_string_literal: true

require 'config'
require 'ctci/ctci_c1_p3'

module CTCI
  module C1
    class TestP3 < Minitest::Test
      include P3

      def test_returns_true_when_is_permutation
        s = 'abc '
        t = 'c ba'
        actual = permutation?(s, t)

        assert_equal(true, actual)
      end

      def test_returns_false_when_not_permutation
        s = 'byz  '
        t = 'cba'
        actual = permutation?(s, t)

        assert_equal(false, actual)
      end

      def test_returns_false_when_empty_string
        s = ''
        t = 'abc'
        first_actual = permutation?(s, t)
        second_actual = permutation?(t, s)

        assert_equal(false, first_actual)
        assert_equal(false, second_actual)
      end
    end
  end
end
