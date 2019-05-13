# frozen_string_literal: true

require 'config'

require 'data_structures/binary_search_tree_map'
require 'epi/epi_c10_p1'

module EPI
  module C10
    class TestP1 < Minitest::Test
      BinarySearchTreeMap = DataStructures::BinarySearchTreeMap.dup.class_exec do
        include P1
      end

      def test_balanced_is_implemented
        assert_respond_to(BinarySearchTreeMap.new, :balanced?)
      end
    end
  end
end
