# typed: false
# frozen_string_literal: true

module LeetCode
  # 141. Linked List Cycle
  module LC141
    ListNode = Struct.new(:val, :next)

    # Description:
    # Given a linked list, determine if it has a cycle in it.
    #
    # Notes:
    # - Can you solve it without using extra space?
    #
    # @param list {ListNode}
    # @return {Boolean}
    def cycle?(list)
      return false if !list || !list.next

      slow = list
      fast = list

      loop {
        return false if !slow || !fast || !fast.next

        slow = slow.next
        fast = fast.next.next

        return true if slow == fast
      }
    end

    alias has_cycle cycle?
  end
end
