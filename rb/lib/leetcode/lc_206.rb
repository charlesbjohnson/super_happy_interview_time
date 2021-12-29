# frozen_string_literal: true

module LeetCode
  # 206. Reverse Linked List
  module LC206
    # Description:
    # Reverse a singly linked list.
    #
    # Follow Up:
    # A linked list can be reversed either iteratively or recursively. Could you implement both?
    #
    # Examples:
    # Input: head = [1, 2, 3, 4, 5]
    # Output: [5, 4, 3, 2, 1]
    #
    # Input: head = [1, 2]
    # Output: [2, 1]
    #
    # Input: head = []
    # Output: []
    #
    # @param {ListNode} head
    # @return {ListNode}
    def reverse_list(head)
      curr = head

      while curr&.next
        new_head = curr.next

        curr.next = new_head.next
        new_head.next = head

        head = new_head
      end

      head
    end
  end
end
