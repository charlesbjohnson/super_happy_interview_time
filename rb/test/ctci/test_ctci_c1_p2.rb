# typed: true
# frozen_string_literal: true

require 'config'
require 'ctci/ctci_c1_p2'

module CTCI
  module C1
    class TestP2 < Minitest::Test
      include P2

      def test_reverses_a_string
        s = 'Hello World!'
        expected = '!dlroW olleH'
        actual = reverse(s)

        assert_equal(expected, actual)
      end

      def test_returns_empty_string_when_given_empty_string
        s = ''
        expected = ''
        actual = reverse(s)

        assert_equal(expected, actual)
      end
    end
  end
end
