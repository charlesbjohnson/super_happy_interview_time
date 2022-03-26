# frozen_string_literal: true

module LeetCode
  # 92. Reverse Linked List II
  module LC92
    ListNode = Helpers::LeetCode::LinkedList::ListNode

    # Description:
    # Given the head of a singly linked list and two integers left and right where left <= right,
    # reverse the nodes of the list from position left to position right, and return the reversed list.
    #
    # Follow up: Could you do it in one pass?
    #
    # Examples:
    # Input: head = [1, 2, 3, 4, 5], left = 2, right = 4
    # Output: [1, 4, 3, 2, 5]
    #
    # Input: head = [5], left = 1, right = 1
    # Output: [5]
    #
    # @param {ListNode} head
    # @param {Integer} left
    # @param {Integer} right
    # @return {ListNode}
    def reverse_between(head, left, right)
      s = ListNode.new(nil, head)

      prev = s
      node = head

      dist = right - left

      while left > 1
        prev = node
        node = node.next
        left -= 1
      end

      r_head = node

      while dist > 0
        p_head = r_head
        n_head = node.next

        node.next = n_head.next
        n_head.next = p_head

        r_head = n_head
        dist -= 1
      end

      prev.next = r_head
      s.next
    end
  end
end
