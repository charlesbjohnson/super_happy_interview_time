# typed: true
# frozen_string_literal: true

require "config"

require "data_structures/linked_list"
require "ctci/ctci_c2_p3"

module CTCI
  module C2
    class TestP3 < Minitest::Test
      LinkedList = DataStructures::LinkedList.dup.class_exec {
        include P3
      }

      def setup
        @list = LinkedList.new
        3.times { |n| @list.append(n) } # 0,1,2
      end

      def test_delete_node
        doomed = @list.instance_variable_get(:@head).next.next # 1
        @list.delete_node(doomed)
        assert_equal(2, @list.size)
        assert_equal(0, @list[0])
        assert_equal(2, @list[1])
        assert_nil(@list[2])
      end

      def test_delete_node_first_item
        doomed = @list.instance_variable_get(:@head) # 0

        @list.delete_node(doomed)
        assert_equal(2, @list.size)
        assert_equal(1, @list[0])
        assert_equal(2, @list[1])
        assert_nil(@list[2])
      end
    end
  end
end
