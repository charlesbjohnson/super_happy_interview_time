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
      return head if !head || !head.next

      before = nil
      swap_l = head
      swap_r = head.next
      after = head.next.next

      head = swap_r

      while swap_l && swap_r
        if before
          before.next = swap_r
        end

        swap_l.next = after
        swap_r.next = swap_l

        before = swap_l
        swap_l = after
        swap_r = after ? after.next : nil
        after = swap_r ? swap_r.next : nil
      end

      head
    end
  end
end
