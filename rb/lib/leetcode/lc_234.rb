# frozen_string_literal: true

module LeetCode
  # 234. Palindrome Linked List
  module LC234
    # Description:
    # Given a singly linked list, determine if it is a palindrome.
    #
    # Follow up: Could you do it in O(n) time and O(1) space?
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

      while i.next && j&.next
        i = i.next
        j = j.next.next
      end

      l = head
      r = j.nil? ? i : i.next

      i = r

      while i&.next
        p_head = r
        n_head = i.next

        i.next = n_head.next
        n_head.next = p_head

        r = n_head
      end

      while r && l.val == r.val
        l = l.next
        r = r.next
      end

      r.nil?
    end
  end
end
