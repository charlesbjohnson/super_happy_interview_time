# typed: true
# frozen_string_literal: true

require 'config'
require 'ctci/ctci_c1_p4'

module CTCI
  module C1
    class TestP4 < Minitest::Test
      include P4

      def test_encodes_spaces
        s = 'Mr John Smith'
        actual = encode_spaces(s)

        assert_equal('Mr%20John%20Smith', actual)
      end

      def test_collapses_spaces_before_encoding
        s = 'Mr  John   Smith'
        actual = encode_spaces(s)

        assert_equal('Mr%20John%20Smith', actual)
      end

      def test_does_not_encode_spaces_at_end_of_string
        s = 'Mr  John   Smith  '
        actual = encode_spaces(s)

        assert_equal('Mr%20John%20Smith', actual)
      end

      def test_empty_string_returns_empty_string
        s = ' '
        actual = encode_spaces(s)

        assert_equal('', actual)
      end
    end
  end
end
