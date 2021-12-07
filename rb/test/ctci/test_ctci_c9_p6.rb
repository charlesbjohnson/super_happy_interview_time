# frozen_string_literal: true

require("config")
require("ctci/ctci_c9_p6")

module CTCI
  module C9
    class TestP6 < Minitest::Test
      include(P6)

      def test_returns_combinations_of_parentheses
        one = %w[()]
        assert_equal(one, parentheses_combinations(1))

        two = %w[(()) ()()]
        assert_equal(two, parentheses_combinations(2))

        three = %w[((())) (()()) (())() ()(()) ()()()]
        assert_equal(three, parentheses_combinations(3))
      end

      def test_returns_nothing_for_zero_or_less
        assert_empty(parentheses_combinations(0))
        assert_empty(parentheses_combinations(-5))
      end
    end
  end
end
