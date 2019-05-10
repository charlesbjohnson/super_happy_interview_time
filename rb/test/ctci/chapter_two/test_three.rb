# frozen_string_literal: true

require 'config'

module CTCI
  module ChapterTwo
    class TestThree < Minitest::Test
      LinkedList = DataStructures::LinkedList.dup.class_exec do
        include Three
      end

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
