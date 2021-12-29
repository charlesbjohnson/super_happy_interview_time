# frozen_string_literal: true

module LeetCode
  # 234. Palindrome Linked List
  module LC234
    # Description:
    # Given a singly linked list, determine if it is a palindrome.
    #
    # Could you do it in O(n) time and O(1) space?
    #
    # Examples:
    # Input: head = [1, 2, 2, 1]
    # Output: true
    #
    # Input: head = [1, 2]
    # Output: false
    #
    # @param {ListNode} head
    # @return {Boolean}
    def is_palindrome(head)
      i = head
      j = head

      i_pred = nil

      while j&.next
        head = i
        j = j.next.next

        i_succ = i.next
        i.next = i_pred
        i_pred = i

        i = i_succ
      end

      i = i.next if j
      j = head

      while i
        return false if i.val != j.val

        i = i.next
        j = j.next
      end

      true
    end
  end
end
