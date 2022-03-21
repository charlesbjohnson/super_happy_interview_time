# frozen_string_literal: true

module LeetCode
  # 141. Linked List Cycle
  module LC141
    # Description:
    # Given head, the head of a linked list, determine if the linked list has a cycle in it.
    #
    # There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.
    # Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
    #
    # Return true if there is a cycle in the linked list. Otherwise, return false.
    #
    # Follow up: Can you solve it using O(1) (i.e. constant) memory?
    #
    # Examples:
    # Input: head = [3, 2, 0, -4], pos = 1
    # Output: true
    #
    # Input: head = [1, 2], pos = 0
    # Output: true
    #
    # Input: head = [1], pos = -1
    # Output: false
    #
    # @param {ListNode} head
    # @return {Boolean}
    def has_cycle(head)
      i = head
      j = head

      loop {
        i = i&.next
        j = j&.next&.next

        break if i == j
      }

      !i.nil? && !j.nil?
    end
  end
end
