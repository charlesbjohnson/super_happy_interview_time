# frozen_string_literal: true

module LeetCode
  # 21. Merge Two Sorted Lists
  module LC21
    # Description:
    # You are given the heads of two sorted linked lists list1 and list2.
    #
    # Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.
    #
    # Return the head of the merged linked list.
    #
    # Examples:
    # Input: list1 = [1, 2, 4], list2 = [1, 3, 4]
    # Output: [1, 1, 2, 3, 4, 4]
    #
    # Input: list1 = [], list2 = []
    # Output: []
    #
    # Input: list1 = [], list2 = [0]
    # Output: [0]
    #
    # @param {ListNode} list1
    # @param {ListNode} list2
    # @return {ListNode}
    def merge_two_lists(list1, list2)
      return if !list1 && !list2

      head = nil
      curr = nil

      i = list1
      j = list2

      while i || j
        if !j || (i && j && i.val < j.val)
          i_succ = i.next

          if !head
            head = i
          else
            curr.next = i
          end

          i = i_succ
        elsif !i || (i && j && i.val >= j.val)
          j_succ = j.next

          if !head
            head = j
          else
            curr.next = j
          end

          j = j_succ
        end

        curr = curr ? curr.next : head
      end

      head
    end
  end
end
