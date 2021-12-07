# frozen_string_literal: true

require("config")

require("data_structures/binary_search_tree_map")
require("ctci/ctci_c4_p3")

module CTCI
  module C4
    class TestP3 < Minitest::Test
      BinarySearchTreeMap = DataStructures::BinarySearchTreeMap.dup.class_exec {
        include(P3Helpers)
        extend(P3)
      }

      def test_creates_tree_with_minimal_height_odd
        from = (1..7).to_a
        @tree = BinarySearchTreeMap.create_min_height(from)

        assert_equal(2, @tree.height)
      end

      def test_creates_tree_with_minimal_height_even
        from = (1..6).to_a
        @tree = BinarySearchTreeMap.create_min_height(from)

        assert_equal(2, @tree.height)
      end

      def test_does_nothing_if_empty
        @tree = BinarySearchTreeMap.create_min_height([])
        assert_equal(-1, @tree.height)
      end
    end
  end
end
