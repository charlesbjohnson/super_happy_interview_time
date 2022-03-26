# frozen_string_literal: true

module LeetCode
  # 19. Remove Nth Node From End of List
  module LC19
    ListNode = Helpers::LeetCode::LinkedList::ListNode

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
      s = ListNode.new(nil, head)

      i = s
      j = s

      while n >= 0
        j = j.next
        n -= 1
      end

      while j
        i = i.next
        j = j.next
      end

      i.next = i.next.next
      s.next
    end
  end
end
