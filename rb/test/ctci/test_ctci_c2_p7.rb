# typed: true
# frozen_string_literal: true

require("config")

require("data_structures/linked_list")
require("ctci/ctci_c2_p7")

module CTCI
  module C2
    class TestP7 < Minitest::Test
      LinkedList = DataStructures::LinkedList.dup.class_exec {
        include(P7)
      }

      def setup
        @list = LinkedList.new
      end

      def test_palindrome_true
        "racecar".chars.each { |c| @list.append(c) }
        assert(@list.palindrome?)
      end

      def test_palindrome_false
        "meh".chars.each { |c| @list.append(c) }
        refute(@list.palindrome?)
      end

      def test_palindrome_numeric
        [1, 0, 1].each { |n| @list.append(n) }
        assert(@list.palindrome?)
      end

      def test_palindrome_empty
        assert(@list.palindrome?)
      end

      def test_palindrome_single
        @list.append("a")
        assert(@list.palindrome?)
      end
    end
  end
end
