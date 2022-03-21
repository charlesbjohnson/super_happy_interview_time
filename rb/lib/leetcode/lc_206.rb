# frozen_string_literal: true

module LeetCode
  # 206. Reverse Linked List
  module LC206
    # Description:
    # Reverse a singly linked list.
    #
    # Follow Up: A linked list can be reversed either iteratively or recursively. Could you implement both?
    #
    # Examples:
    # Input: head = [1, 2, 3, 4, 5]
    # Output: [5, 4, 3, 2, 1]
    #
    # Input: head = [1, 2]
    # Output: [2, 1]
    #
    # Input: head = []
    # Output: []
    #
    # @param {ListNode} head
    # @return {ListNode}
    def reverse_list(head)
      result = private_methods.grep(/^reverse_list_\d+$/).map { |m| send(m, head.clone) }.uniq { |v| v&.val }
      result.length == 1 ? result[0] : raise
    end

    private

    def reverse_list_1(head)
      i = head

      while i&.next
        p_head = head
        n_head = i.next

        i.next = n_head.next
        n_head.next = p_head

        head = n_head
      end

      head
    end

    def reverse_list_2(head)
      rec = ->(i, j) {
        if !j&.next
          head = j
          return head
        end

        rec.call(j, j.next).next = j
        j.next = i

        j
      }

      rec.call(nil, head)
      head
    end
  end
end
