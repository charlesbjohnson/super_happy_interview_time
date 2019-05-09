# frozen_string_literal: true

module CTCI
  module C2
    module P3
      # Implement an algorithm to delete a node in the middle
      # of a single linked list, given only access to that node.
      def delete_node(node)
        node.data = node.next.data
        doomed = node.next
        node.next = doomed.next
      end
    end
  end
end
