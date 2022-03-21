# frozen_string_literal: true

module LeetCode
  # 83. Remove Duplicates from Sorted List
  module LC83
    # Description:
    # Given the head of a sorted linked list, delete all duplicates such that each element appears only once.
    # Return the linked list sorted as well.
    #
    # Examples:
    # Input: head = [1, 1, 2]
    # Output: [1, 2]
    #
    # Input: head = [1, 1, 2, 3, 3]
    # Output: [1, 2, 3]
    #
    # @param {ListNode} head
    # @return {ListNode}
    def delete_duplicates(head)
      i = head
      j = i&.next

      while j
        if i.val == j.val
          i.next = j.next
        else
          i = i.next
        end

        j = j.next
      end

      head
    end
  end
end
