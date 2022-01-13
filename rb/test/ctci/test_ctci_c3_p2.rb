# typed: true
# frozen_string_literal: true

require("config")
require("ctci/ctci_c3_p2")

module CTCI
  module C3
    class TestP2 < Minitest::Test
      def setup
        @stack = P2.new
      end

      def test_min_returns_minimum
        min = 0
        [3, 5, 2, 7, min].each { |i| @stack.push(i) }

        assert_equal(min, @stack.my_min)
      end

      def test_min_returns_minimum_after_pop
        min = 3
        [5, 8, 7, min, 0].each { |i| @stack.push(i) }

        @stack.pop
        assert_equal(min, @stack.my_min)
      end

      def test_min_returns_nil_when_empty
        assert_nil(@stack.my_min)
      end
    end
  end
end
