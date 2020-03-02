# typed: true
# frozen_string_literal: true

require "config"
require "epi/epi_c13_p1"

module EPI
  module C13
    class TestP1 < Minitest::Test
      include P1

      def test_anagram_sets_returns_groups_of_words_that_are_anagrams
        words = %w[backward rash cats chase rentals calm acts sternal burned clam drawback cast aches antlers]
        result = anagram_sets(words)
        assert_equal([
          ["aches", %w[chase]],
          ["acts", %w[cast cats]],
          ["antlers", %w[rentals sternal]],
          ["backward", %w[drawback]],
          ["calm", %w[clam]],
        ], result)
      end

      def test_anagram_sets_returns_no_groups_when_no_words_are_anagrams
        words = %w[cats dog pants]
        result = anagram_sets(words)
        assert_equal([], result)
      end

      def test_anagram_sets_returns_no_groups_when_no_words_given
        result = anagram_sets([])
        assert_equal([], result)
      end
    end
  end
end
