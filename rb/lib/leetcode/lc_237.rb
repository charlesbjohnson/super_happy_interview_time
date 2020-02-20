# typed: true
# frozen_string_literal: true

module LeetCode
  # 237. Delete Node in a Linked List
  module LC237
    ListNode = Struct.new(:val, :next)

    def delete_node_recurse(node)
      return node unless node.next

      ahead = delete_node_recurse(node.next)
      result = ListNode.new(node.val, node)

      node.val = ahead.val
      node.next = ahead.next

      result
    end

    # Description:
    # Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.
    #
    # Examples:
    # Input: list = 1->2->3->4, node = 3
    # Output: nil
    # where list = 1->2->4
    #
    # @param node {ListNode}
    # @return {nil}
    def delete_node(node)
      delete_node_recurse(node)

      nil
    end
  end
end
