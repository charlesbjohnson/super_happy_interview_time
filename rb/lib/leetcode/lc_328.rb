# frozen_string_literal: true

module LeetCode
  # 328. Odd Even Linked List
  module LC328
    ListNode = Struct.new(:val, :next)

    # Description:
    # Given a singly linked list, group all odd nodes together followed by the even nodes.
    # Please note here we are talking about the node number and not the value in the nodes.
    #
    # Examples:
    # Input: 1->2->3->4->5
    # Output: 1->3->5->2->4
    #
    # Notes:
    # - The relative order inside both the even and odd groups should remain as it was in the input.
    # - The first node is considered odd, the second node even and so on ...
    # - You should try to do it in place. The program should run in O(1) space complexity and O(n) time complexity.
    #
    # @param list {ListNode}
    # @return {ListNode}
    def odd_even_list(list)
      return unless list

      head_odds = list
      head_evens = list.next

      cursor_odds = head_odds
      cursor_evens = head_evens

      while cursor_evens
        cursor_odds.next = cursor_evens.next

        break unless cursor_odds.next
        cursor_odds = cursor_odds.next

        cursor_evens.next = cursor_odds.next
        cursor_evens = cursor_evens.next
      end

      cursor_odds.next = head_evens
      head_odds
    end
  end
end
