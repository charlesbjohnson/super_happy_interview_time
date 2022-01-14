# frozen_string_literal: true

module Algorithms
  module SubstringSearch
    module SharedBehavior
      def test_returns_the_first_index_where_the_substring_can_be_found_in_the_string
        assert_equal(0, subject("mississippi", "mi"))
        assert_equal(4, subject("mississippi", "issip"))
        assert_equal(9, subject("mississippi", "pi"))
      end

      define_method(:"test_returns_-1_if_the_substring_cannot_be_found_in_the_string") {
        assert_equal(-1, subject("mississippi", "ississim"))
      }

      def test_returns_0_if_the_string_and_the_substring_are_equal
        assert_equal(0, subject("mississippi", "mississippi"))
      end

      define_method(:"test_returns_-1_if_the_string_is_empty") {
        assert_equal(-1, subject("", "foo"))
      }

      def test_returns_0_if_the_substring_is_empty
        assert_equal(0, subject("foo", ""))
      end

      def test_returns_0_if_the_string_and_the_substring_are_empty
        assert_equal(0, subject("", ""))
      end
    end
  end
end
