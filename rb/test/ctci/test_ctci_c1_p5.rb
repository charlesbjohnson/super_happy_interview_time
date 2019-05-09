# frozen_string_literal: true

require 'config'
require 'ctci/ctci_c1_p5'

module CTCI
  module C1
    class TestP5 < Minitest::Test
      include P5

      def test_compresses_a_string
        s = 'aabcccccaaa'
        actual = compress(s)

        assert_equal('a2b1c5a3', actual)
      end

      def test_doesnt_compress_short_strings
        s = 'aabc'
        actual = compress(s)

        assert_equal('aabc', actual)
      end

      def test_empty_string_returns_empty_string
        s = ''
        actual = compress(s)

        assert_equal('', actual)
      end
    end
  end
end
