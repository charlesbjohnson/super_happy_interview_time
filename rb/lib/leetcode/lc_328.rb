# frozen_string_literal: true

module LeetCode
  # 328. Odd Even Linked List
  module LC328
    # Description:
    # Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices,
    # and return the reordered list.
    #
    # The first node is considered odd, and the second node is even, and so on.
    #
    # Note that the relative order inside both the even and odd groups should remain as it was in the input.
    #
    # You must solve the problem in O(1) extra space complexity and O(n) time complexity.
    #
    # Examples:
    # Input: head = [1, 2, 3, 4, 5]
    # Output: [1, 3, 5, 2, 4]
    #
    # Input: head = [2, 1, 3, 5, 6, 4, 7]
    # Output: [2, 3, 6, 7, 1, 5, 4]
    #
    # @param {ListNode} head
    # @return {ListNode}
    def odd_even_list(head)
      return if !head

      head_odd = head
      head_even = head.next

      curr_odd = head_odd
      curr_even = head_even

      while curr_odd.next && curr_even.next
        curr_odd.next = curr_even.next
        curr_odd = curr_odd.next

        curr_even.next = curr_odd.next
        curr_even = curr_even.next
      end

      curr_odd.next = head_even
      head_odd
    end
  end
end
