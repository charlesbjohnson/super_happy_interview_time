# typed: true
# frozen_string_literal: true

module LeetCode
  # 19. Remove Nth Node From End of List
  module LC19
    ListNode = Struct.new(:val, :next)

    def delete_middle(node)
      doomed = node.next
      node.next = doomed.next
      doomed.next = nil

      doomed
    end

    def delete_head(node)
      return node unless node.next

      ahead = delete_head(node.next)

      result = ListNode.new(node.val)
      result.next = node

      node.val = ahead.val
      node.next = ahead.next

      result
    end

    def remove_nth_from_end_recurse(node, iteration, nth)
      return 1 unless node

      offset = remove_nth_from_end_recurse(node.next, iteration + 1, nth)

      delete_middle(node) if offset == nth + 1
      delete_head(node) if iteration.zero? && offset == nth

      offset + 1
    end

    # Description:
    # Given a linked list, remove the nth node from the end of list and return its head.
    # Examples:
    # Input: list = 1->2->3->4->5, nth = 2
    # Output: 1->2->3->5
    #
    # Notes:
    # - Given n will always be valid.
    # - Try to do this in one pass.
    #
    # @param list {ListNode}
    # @param nth {Integer}
    # @return {ListNode}
    def remove_nth_from_end(list, nth)
      return if nth == 1 && !list.next

      remove_nth_from_end_recurse(list, 0, nth)
      list
    end
  end
end
