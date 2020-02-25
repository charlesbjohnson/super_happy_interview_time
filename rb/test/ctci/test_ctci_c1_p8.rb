# typed: true
# frozen_string_literal: true

require "config"
require "ctci/ctci_c1_p8"

module CTCI
  module C1
    class TestP8 < Minitest::Test
      include P8

      def test_returns_true_if_is_rotation
        s = "waterbottle"
        t = "erbottlewat"
        actual = rotation?(s, t)

        assert(actual)
      end

      def test_returns_false_if_is_not_rotation
        s = "shazbot"
        t = "shbotaz"
        actual = rotation?(s, t)

        refute(actual)
      end

      def test_returns_false_when_given_empty_string
        first_s = ""
        first_t = "erbottlewat"
        second_s = "waterbottle"
        second_t = ""
        third_s = ""
        third_t = ""

        first_actual = rotation?(first_s, first_t)
        second_actual = rotation?(second_s, second_t)
        third_actual = rotation?(third_s, third_t)

        refute(first_actual)
        refute(second_actual)
        refute(third_actual)
      end
    end
  end
end
