# typed: true
# frozen_string_literal: true

require("config")
require("ctci/ctci_c9_p5")

module CTCI
  module C9
    class TestP5 < Minitest::Test
      include(P5)

      def test_permutations_returns_permutations_of_string
        assert_equal(%w[a], permutations("a"))
        assert_equal(%w[ab ba].sort, permutations("ab").sort)
        assert_equal(%w[abc acb bac bca cab cba].sort, permutations("abc").sort)
      end

      def test_permutations_returns_empty_string_when_empty_string
        assert_equal([""], permutations(""))
      end
    end
  end
end
