# typed: true
# frozen_string_literal: true

require("config")
require("ctci/ctci_c9_p1")

module CTCI
  module C9
    class TestP1 < Minitest::Test
      def test_returns_number_of_ways_to_skip_steps
        assert_equal(1, P1.count_ways_to_skip_steps(1))
        assert_equal(2, P1.count_ways_to_skip_steps(2))
        assert_equal(4, P1.count_ways_to_skip_steps(3))
        assert_equal(7, P1.count_ways_to_skip_steps(4))
        assert_equal(13, P1.count_ways_to_skip_steps(5))
      end

      def test_returns_zero_if_none
        assert_equal(1, P1.count_ways_to_skip_steps(0))
      end
    end
  end
end
