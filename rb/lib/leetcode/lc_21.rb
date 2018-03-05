# frozen_string_literal: true

module LeetCode
  # 21. Merge Two Sorted Lists
  module LC21
    ListNode = Struct.new(:val, :next)

    # Description:
    # Merge two sorted linked lists and return it as a new list.
    # The new list should be made by splicing together the nodes of the first two lists.
    #
    # Examples:
    # Input: left = 1->2->4, right = 1->3->4
    # Output: 1->1->2->3->4->4
    #
    # @param left {ListNode}
    # @param right {ListNode}
    # @return {ListNode}
    def merge_two_lists(left, right)
      return if !left && !right
      return right unless left
      return left unless right

      head = nil

      l_cursor = left
      r_cursor = right

      if l_cursor.val <= r_cursor.val
        head = l_cursor
        l_cursor = l_cursor.next
      else
        head = r_cursor
        r_cursor = r_cursor.next
      end

      cursor = head

      while l_cursor && r_cursor
        if l_cursor.val <= r_cursor.val
          cursor.next = l_cursor
          l_cursor = l_cursor.next
        else
          cursor.next = r_cursor
          r_cursor = r_cursor.next
        end

        cursor = cursor.next
      end

      cursor.next = r_cursor unless l_cursor
      cursor.next = l_cursor unless r_cursor

      head
    end
  end
end
