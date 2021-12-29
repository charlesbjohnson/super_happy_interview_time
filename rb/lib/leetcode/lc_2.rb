# frozen_string_literal: true

module LeetCode
  # 2. Add Two Numbers
  module LC2
    ListNode = Helpers::LeetCode::LinkedList::ListNode

    # Description:
    # You are given two non-empty linked lists representing two non-negative integers.
    # The digits are stored in reverse order, and each of their nodes contains a single digit.
    # Add the two numbers and return the sum as a linked list.
    #
    # You may assume the two numbers do not contain any leading zero, except the number 0 itself.
    #
    # Examples
    # Input: l1 = [2, 4, 3], l2 = [5, 6, 4]
    # Output: [7, 0, 8]
    #
    # Input: l1 = [0], l2 = [0]
    # Output: [0]
    #
    # Input: l1 = [9, 9, 9, 9, 9, 9, 9], l2 = [9, 9, 9, 9]
    # Output: [8, 9, 9, 9, 0, 0, 0, 1]
    #
    # @param {ListNode} l1
    # @param {ListNode} l2
    # @return {ListNode}
    def add_two_numbers(l1, l2)
      head = ListNode.new(nil)

      sum = head
      carry = 0

      while l1 || l2 || carry.positive?
        if sum.val
          sum.next = ListNode.new(nil)
          sum = sum.next
        end

        if l1
          sum.val = (sum.val || 0) + l1.val
          l1 = l1.next
        end

        if l2
          sum.val = (sum.val || 0) + l2.val
          l2 = l2.next
        end

        sum.val = (sum.val || 0) + carry
        carry, sum.val = sum.val.divmod(10)
      end

      head
    end
  end
end
