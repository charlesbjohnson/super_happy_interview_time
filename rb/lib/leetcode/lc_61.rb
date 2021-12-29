# frozen_string_literal: true

module LeetCode
  # 61. Rotate List
  module LC61
    # Description:
    # Given the head of a linked list, rotate the list to the right by k places.
    #
    # Examples:
    # Input: head = [1, 2, 3, 4, 5], k = 2
    # Output: [4, 5, 1, 2, 3]
    #
    # Input: head = [0, 1, 2], k = 4
    # Output: [2, 0, 1]
    #
    # @param {ListNode} head
    # @param {Integer} k
    # @return {ListNode}
    def rotate_right(head, k)
      return if !head || !head.next

      size = 0
      i = head

      while i
        size += 1
        i = i.next
      end

      i = head
      j = head

      k %= size
      return head if k == 0

      distance = 0

      while j.next
        if distance < k
          distance += 1
        else
          i = i.next
        end

        j = j.next
      end

      j.next = head
      head = i.next
      i.next = nil

      head
    end
  end
end
