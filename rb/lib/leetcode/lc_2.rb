# frozen_string_literal: true

module LeetCode
  # 2. Add Two Numbers
  module LC2
    ListNode = Struct.new(:val, :next)

    # Description:
    # You are given two non-empty linked lists representing two non-negative integers.
    # The digits are stored in reverse order and each of their nodes contain a single digit.
    # Add the two numbers and return it as a linked list.
    #
    # Examples:
    # Input: left = 2->4->3, right = 5->6->4
    # Output: 7->0->8
    # Explanation: 342 + 465 = 807
    #
    # Notes:
    # - You may assume the two numbers do not contain any leading zero, except the number 0 itself.
    #
    # @param left {ListNode}
    # @param right {ListNode}
    # @return {ListNode}
    def add_two_numbers(left, right)
      head = ListNode.new(nil)

      sum = head
      carry = 0

      while left || right || carry.positive?
        if sum.val
          sum.next = ListNode.new(nil)
          sum = sum.next
        end

        if left
          sum.val = (sum.val || 0) + left.val
          left = left.next
        end

        if right
          sum.val = (sum.val || 0) + right.val
          right = right.next
        end

        sum.val = (sum.val || 0) + carry
        carry, sum.val = sum.val.divmod(10)
      end

      head
    end
  end
end
