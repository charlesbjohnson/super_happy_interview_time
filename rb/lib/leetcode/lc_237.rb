# frozen_string_literal: true

module LeetCode
  # 237. Delete Node in a Linked List
  module LC237
    # Description:
    # Write a function to delete a node in a singly-linked list.
    # You will not be given access to the head of the list, instead you will be given access to the node to be deleted directly.
    #
    # It is guaranteed that the node to be deleted is not a tail node in the list.
    #
    # Examples:
    # Input: head = [4, 5, 1, 9], node = 5
    # Output: [4, 1, 9]
    #
    # Input: head = [4, 5, 1, 9], node = 1
    # Output: [4, 5, 9]
    #
    # @param {ListNode} node
    # @return {nil}
    def delete_node(node)
      loop {
        node.val = node.next.val
        break if !node.next.next
        node = node.next
      }

      node.next = nil
    end
  end
end
