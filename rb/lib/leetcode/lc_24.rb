# frozen_string_literal: true

module LeetCode
  # 24. Swap Nodes in Pairs
  module LC24
    # Description:
    # Given a linked list, swap every two adjacent nodes and return its head.
    # You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)
    #
    # Examples:
    # Input: head = [1, 2, 3, 4]
    # Output: [2, 1, 4, 3]
    #
    # Input: head = []
    # Output: []
    #
    # Input: head = [1]
    # Output: [1]
    #
    # @param {ListNode} head
    # @return {ListNode}
    def swap_pairs(head)
      return unless head
      return head unless head.next

      tmp = swap_pairs(head&.next&.next)

      new_head = head.next
      head.next = tmp

      new_head.next = head
      new_head
    end
  end
end
