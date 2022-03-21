# frozen_string_literal: true

module LeetCode
  # 876. Middle of the Linked List
  module LC876
    # Description:
    # Given the head of a singly linked list, return the middle node of the linked list.
    #
    # If there are two middle nodes, return the second middle node.
    #
    # Examples:
    # Input: head = [1, 2, 3, 4, 5]
    # Output: [3, 4, 5]
    #
    # Input: head = [1, 2, 3, 4, 5, 6]
    # Output: [4, 5, 6]
    #
    # @param {ListNode} head
    # @return {ListNode}
    def middle_node(head)
      i = head
      j = head

      while j&.next
        i = i.next
        j = j.next.next
      end

      i
    end
  end
end
