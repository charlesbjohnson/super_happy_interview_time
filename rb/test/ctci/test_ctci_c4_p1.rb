# frozen_string_literal: true

require("config")

require("data_structures/binary_search_tree_map")
require("ctci/ctci_c4_p1")

module CTCI
  module C4
    class TestP1 < Minitest::Test
      BinarySearchTreeMap = DataStructures::BinarySearchTreeMap.dup.class_exec {
        include(P1)
      }

      def setup
        @tree = BinarySearchTreeMap.new
      end

      def test_returns_true_if_tree_is_balanced
        @tree.put(:c, 3)
        @tree.put(:a, 1)
        @tree.put(:b, 2)
        @tree.put(:d, 4)

        assert_predicate(@tree, :balanced?)
      end

      def test_returns_false_if_tree_is_not_balanced
        @tree.put(:b, 2)
        @tree.put(:a, 1)
        @tree.put(:c, 3)
        @tree.put(:d, 4)
        @tree.put(:e, 5)

        refute_predicate(@tree, :balanced?)
      end

      def test_returns_true_if_empty
        assert_predicate(@tree, :balanced?)
      end
    end
  end
end
