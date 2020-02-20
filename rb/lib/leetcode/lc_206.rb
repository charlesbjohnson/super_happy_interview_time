# typed: true
# frozen_string_literal: true

module LeetCode
  # 206. Reverse Linked List
  module LC206
    ListNode = Struct.new(:val, :next)

    def reverse_list_recurse(node, box)
      unless node.next
        box[0] = node
        return node
      end

      previous = reverse_list_recurse(node.next, box)
      previous.next = node
    end

    # Description:
    # Reverse a singly linked list.
    #
    # Notes:
    # A linked list can be reversed either iteratively or recursively. Could you implement both?
    #
    # @param list {ListNode}
    # @return {ListNode}
    def reverse_list(list)
      return unless list

      box = [nil]

      reverse_list_recurse(list, box)
      list.next = nil

      box.first
    end
  end
end
