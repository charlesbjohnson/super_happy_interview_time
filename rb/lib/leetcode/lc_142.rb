# frozen_string_literal: true

module LeetCode
  # 142. Linked List Cycle II
  module LC142
    # Description:
    # Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.
    #
    # There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed). It is -1 if there is no cycle. Note that pos is not passed as a parameter.
    #
    # Do not modify the linked list.
    #
    # Follow up: Can you solve it using O(1) (i.e. constant) memory?
    #
    # Examples:
    # Input: head = [3, 2, 0, -4], pos = 1
    # Output: tail connects to node index 1
    #
    # Input: head = [1, 2], pos = 0
    # Output: tail connects to node index 0
    #
    # Input: head = [1], pos = -1
    # Output: no cycle
    #
    # @param {ListNode} head
    # @return {ListNode}
    def detect_cycle(head)
      return if !head || !head.next

      slow = head
      fast = head

      loop {
        return if !slow.next || !fast.next || !fast.next.next

        slow = slow.next
        fast = fast.next.next

        break if slow == fast
      }

      cursor = head

      while cursor != slow
        cursor = cursor.next
        slow = slow.next
      end

      cursor
    end
  end
end
