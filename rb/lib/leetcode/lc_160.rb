# typed: false
# frozen_string_literal: true

module LeetCode
  # 160. Intersection of Two Linked Lists
  module LC160
    ListNode = Struct.new(:val, :next)

    # Description:
    # Write a program to find the node at which the intersection of two singly linked lists begins.
    #
    # Examples:
    # Input:
    #   left =  1->2->3
    #                  \
    #                   7->8->9
    #                  /
    #   right =    4->5
    #
    # Output: 7->8->9
    #
    # Notes:
    # - If the two linked lists have no intersection at all, return null.
    # - The linked lists must retain their original structure after the function returns.
    # - You may assume there are no cycles anywhere in the entire linked structure.
    # - Your code should preferably run in O(n) time and use only O(1) memory.
    #
    # @param left {ListNode}
    # @param right {ListNode}
    # @return {ListNode}
    def intersection_node(left, right)
      return if !left || !right

      cursor_left = left
      cursor_right = right

      end_left = nil
      end_right = nil

      while cursor_left != cursor_right
        if !cursor_left.next
          end_left = cursor_left
          cursor_left = right
        else
          cursor_left = cursor_left.next
        end

        if !cursor_right.next
          end_right = cursor_right
          cursor_right = left
        else
          cursor_right = cursor_right.next
        end

        return if end_left && end_right && end_left != end_right
      end

      cursor_left
    end

    alias get_intersection_node intersection_node
  end
end
