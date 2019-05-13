# frozen_string_literal: true

require 'config'

require 'data_structures/stack'
require 'ctci/ctci_c3_p6'

module CTCI
  module C3
    class TestP6 < Minitest::Test
      include P6

      def setup
        @stack = DataStructures::Stack.new
      end

      def test_sort_ascending
        expected = (1..5).to_a.reverse
        expected.shuffle.each { |i| @stack.push(i) }

        assert_equal expected, sort_ascending(@stack).to_a
      end

      def test_sort_ascending_when_empty
        assert_equal [], sort_ascending(@stack).to_a
      end

      def test_sort_ascending_when_sorted
        expected = (1..5).to_a.reverse
        expected.reverse_each { |i| @stack.push(i) }

        assert_equal expected, sort_ascending(@stack).to_a
      end

      def test_sort_ascending_when_reverse_sorted
        expected = (1..5).to_a.reverse
        expected.each { |i| @stack.push(i) }

        assert_equal expected, sort_ascending(@stack).to_a
      end
    end
  end
end
