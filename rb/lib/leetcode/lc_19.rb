# frozen_string_literal: true

module LeetCode
  # 19. Remove Nth Node From End of List
  module LC19
    # Description:
    # Given a linked list, remove the nth node from the end of list and return its head.
    # Examples:
    # Input: head = [1, 2, 3, 4, 5], n = 2
    # Output: [1, 2, 3, 5]
    #
    # Input: head = [1], n = 1
    # Output: []
    #
    # Input: head = [1,2], n = 1
    # Output: [1]
    #
    # Notes:
    # - Given n will always be valid.
    # - Try to do this in one pass.
    #
    # @param {ListNode} head
    # @param {Integer} n
    # @return {ListNode}
    def remove_nth_from_end(head, n)
      return if !head || !head.next

      i = head
      j = head

      distance = 0

      while i.next
        i = i.next

        if distance < n
          distance += 1
        else
          j = j.next
        end
      end

      if j == head && distance < n
        head = head.next
      else
        j.next = j.next.next
      end

      head
    end
  end
end
