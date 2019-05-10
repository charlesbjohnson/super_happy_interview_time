# frozen_string_literal: true

require 'config'

module CTCI
  module ChapterOne
    class TestOne < Minitest::Test
      include One

      def test_returns_true_when_all_characters_unique
        s = 'abcde'
        result = unique_chars?(s)

        assert_equal(true, result)
      end

      def test_returns_false_when_not_all_characters_unique
        s = 'abcade'
        result = unique_chars?(s)

        assert_equal(false, result)
      end

      def test_returns_true_when_empty_string
        s = ''
        result = unique_chars?(s)

        assert_equal(true, result)
      end
    end
  end
end
