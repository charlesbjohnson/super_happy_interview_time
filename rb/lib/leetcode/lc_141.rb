# frozen_string_literal: true

module LeetCode
  # 141. Linked List Cycle
  module LC141
    # Description:
    # Given a linked list, determine if it has a cycle in it.
    #
    # Notes:
    # - Can you solve it without using extra space?
    #
    # @param {ListNode} head
    # @return {Boolean}
    def has_cycle(head)
      return false if !head || !head.next

      slow = head
      fast = head

      loop {
        return false if !slow || !fast || !fast.next

        slow = slow.next
        fast = fast.next.next

        return true if slow == fast
      }
    end
  end
end
