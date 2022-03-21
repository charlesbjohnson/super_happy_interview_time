# frozen_string_literal: true

module LeetCode
  # 21. Merge Two Sorted Lists
  module LC21
    ListNode = Helpers::LeetCode::LinkedList::ListNode

    # Description:
    # You are given the heads of two sorted linked lists list1 and list2.
    # Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.
    #
    # Return the head of the merged linked list.
    #
    # Examples:
    # Input: list1 = [1, 2, 4], list2 = [1, 3, 4]
    # Output: [1, 1, 2, 3, 4, 4]
    #
    # Input: list1 = [], list2 = []
    # Output: []
    #
    # Input: list1 = [], list2 = [0]
    # Output: [0]
    #
    # @param {ListNode} list1
    # @param {ListNode} list2
    # @return {ListNode}
    def merge_two_lists(list1, list2)
      result = private_methods.grep(/^merge_two_lists_\d+$/).map { |m| send(m, list1.clone, list2.clone) }.uniq { |v| v&.val }
      result.length == 1 ? result[0] : raise
    end

    private

    def merge_two_lists_1(list1, list2)
      s = ListNode.new
      i = s

      l = list1
      r = list2

      while l && r
        case l.val <=> r.val
        when -1
          i.next = l
          l = l.next
        when 1, 0
          i.next = r
          r = r.next
        end

        i = i.next
      end

      i.next = l || r
      s.next
    end

    def merge_two_lists_2(list1, list2)
      rec = ->(l, r) {
        return if !l && !r

        return l if !r
        return r if !l

        case l.val <=> r.val
        when -1
          l.next = rec.call(l.next, r)
          l
        when 1, 0
          r.next = rec.call(l, r.next)
          r
        end
      }

      rec.call(list1, list2)
    end
  end
end
