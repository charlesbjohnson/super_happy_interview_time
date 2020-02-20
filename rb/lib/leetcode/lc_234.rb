# typed: false
# frozen_string_literal: true

module LeetCode
  # 234. Palindrome Linked List
  module LC234
    ListNode = Struct.new(:val, :next)

    def length(node)
      i = 0
      cursor = node

      while cursor
        cursor = cursor.next
        i += 1
      end

      i
    end

    def seek(node, index)
      cursor = node

      while index.positive?
        cursor = cursor.next
        index -= 1
      end

      cursor
    end

    def reverse_after(node)
      head = node
      node = node.next
      prev = nil

      while node
        ahead = node.next
        node.next = prev

        prev = node
        node = ahead
      end

      head.next = prev
      head
    end

    # Description:
    # Given a singly linked list, determine if it is a palindrome.
    #
    # Notes:
    # - Could you do it in O(n) time and O(1) space?
    #
    # @param list {ListNode}
    # @return {Boolean}
    def palindrome?(list)
      return true if !list || !list.next

      len = length(list)
      mid_len = len.even? ? (len / 2) - 1 : len / 2
      mid_node = seek(list, mid_len)

      reverse_after(mid_node)

      left_cursor = list
      right_cursor = mid_node.next

      while left_cursor != mid_node.next && right_cursor
        return false if left_cursor.val != right_cursor.val

        left_cursor = left_cursor.next
        right_cursor = right_cursor.next
      end

      true
    end

    alias is_palindrome palindrome?
  end
end
