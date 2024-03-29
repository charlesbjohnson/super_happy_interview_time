# frozen_string_literal: true

module Helpers
  module LeetCode
    module LinkedList
      ListNode = Struct.new(:val, :next) {
        # @param {ListNode} original
        def initialize_clone(original)
          super
          self.next = original.next.clone
        end

        # @param {ListNode} original
        def initialize_dup(original)
          super
          self.next = original.next.dup
        end
      }

      # @param {Array} values
      # @return {ListNode}
      def build_linked_list(values, klass: ListNode)
        values.reverse_each.reduce(nil) { |node, v| klass.new(v, node) }
      end

      # @param {Array} values
      # @param {Integer, nil} pos
      # @return {ListNode}
      def build_linked_list_with_cycle(values, pos = nil)
        head = build_linked_list(values)
        return [head, nil] unless pos

        tail = index_linked_list(head, values.length - 1)
        cursor = index_linked_list(head, pos)
        tail.next = cursor

        [head, cursor]
      end

      # @param {ListNode} head
      # @param {Integer} i
      # @return {ListNode}
      def index_linked_list(head, i)
        (0...i).reduce(head) { |node| node.next }
      end
    end
  end
end
