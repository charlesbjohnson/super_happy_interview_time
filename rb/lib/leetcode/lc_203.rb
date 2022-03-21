# frozen_string_literal: true

module LeetCode
  # 203. Remove Linked List Elements
  module LC203
    ListNode = Helpers::LeetCode::LinkedList::ListNode

    # Description:
    # Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val,
    # and return the new head.
    #
    # Examples:
    # Input: head = [1, 2, 6, 3, 4, 5, 6], val = 6
    # Output: [1, 2, 3, 4, 5]
    #
    # Input: head = [], val = 1
    # Output: []
    #
    # Input: head = [7, 7, 7, 7], val = 7
    # Output: []
    #
    # @param {ListNode} head
    # @param {Integer} val
    # @return {ListNode}
    def remove_elements(head, val)
      s = ListNode.new(nil, head)

      i = s
      j = s.next

      while j
        if j.val == val
          i.next = j.next
        else
          i = j
        end

        j = j.next
      end

      s.next
    end
  end
end
