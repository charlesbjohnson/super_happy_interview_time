# frozen_string_literal: true

module LeetCode
  # 61. Rotate List
  module LC61
    ListNode = Helpers::LeetCode::LinkedList::ListNode

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
      return head if !head || !head.next || k == 0

      s = ListNode.new(nil, head)

      i = s
      j = s

      size = 0

      while k > 0 && j.next
        j = j.next
        k -= 1
        size += 1
      end

      k %= size

      if !j.next
        j = s

        while k > 0
          j = j.next
          k -= 1
        end
      end

      return head if i == j

      while j.next
        i = i.next
        j = j.next
      end

      j.next = s.next
      s.next = i.next
      i.next = nil

      s.next
    end
  end
end
