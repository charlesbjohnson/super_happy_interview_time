# frozen_string_literal: true

module LeetCode
  # 160. Intersection of Two Linked Lists
  module LC160
    # Description:
    # Write a program to find the node at which the intersection of two singly linked lists begins.
    #
    # Examples:
    # Input:
    #   head_a = 1->2->3
    #                  \
    #                   7->8->9
    #                  /
    #   head_b =   4->5
    #
    # Output: 7->8->9
    #
    # Notes:
    # - If the two linked lists have no intersection at all, return null.
    # - The linked lists must retain their original structure after the function returns.
    # - You may assume there are no cycles anywhere in the entire linked structure.
    # - Your code should preferably run in O(n) time and use only O(1) memory.
    #
    # @param {ListNode} head_a
    # @param {ListNode} head_b
    # @return {ListNode}
    def get_intersection_node(head_a, head_b)
      i_head = head_a
      j_head = head_b

      i = head_a
      j = head_b

      while i && j && !i.equal?(j)
        i = i.next
        if !i && i_head == head_a
          i_head = head_b
          i = i_head
        end

        j = j.next
        if !j && j_head == head_b
          j_head = head_a
          j = j_head
        end
      end

      i
    end
  end
end
