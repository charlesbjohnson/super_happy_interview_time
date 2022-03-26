# frozen_string_literal: true

module LeetCode
  # 148. Sort List
  module LC148
    ListNode = Helpers::LeetCode::LinkedList::ListNode

    # Description:
    # Given the head of a linked list, return the list after sorting it in ascending order.
    #
    # Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?
    #
    # Examples:
    # Input: head = [4, 2, 1, 3]
    # Output: [1, 2, 3, 4]
    #
    # Input: head = [-1, 5, 3, 4, 0]
    # Output: [-1, 0, 3, 4, 5]
    #
    # Input: head = []
    # Output: []
    #
    # @param {ListNode} head
    # @return {ListNode}
    def sort_list(head)
      return head if !head || !head.next

      head = ListNode.new(nil, head)

      tail = head
      tail = tail.next while tail.next

      partition = ->(p, lo, hi) {
        prev = lo
        node = lo.next

        while node != hi
          case node.val <=> lo.val
          when -1
            prev.next = node.next

            node.next = p.next
            p.next = node

            node = prev.next
          when 0
            if lo.next != node
              prev.next = node.next

              lo.next, node.next = node, lo.next

              node = prev.next
            else
              prev = node
              node = node.next
            end

            lo = lo.next
          when 1
            prev = node
            node = node.next
          end
        end

        lo
      }

      sort = ->(p, lo, hi) {
        return if lo == hi

        mid = partition.call(p, lo, hi)

        sort.call(p, p.next, mid) if p.next.val < mid.val
        sort.call(mid, mid.next, hi) if !hi || mid.next.val < hi.val
      }

      shuffle = -> {
        prev = head
        node = head.next

        while node
          if Random.random_number < 0.5 && prev != head && node != tail
            prev.next = node.next
            node.next = head.next
            head.next = node
          elsif node != tail
            prev.next = node.next
            node.next = tail.next
            tail.next = node
            tail = tail.next
          end

          prev = prev.next
          node = prev&.next
        end
      }

      shuffle.call
      sort.call(head, head.next, tail.next)
      head.next
    end
  end
end
