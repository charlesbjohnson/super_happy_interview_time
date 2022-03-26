# frozen_string_literal: true

module LeetCode
  # 143. Reorder List
  module LC143
    ListNode = Helpers::LeetCode::LinkedList::ListNode

    # Description:
    # You are given the head of a singly linked-list. The list can be represented as:
    #
    #   L0 -> L1 -> ... -> Ln - 1 -> Ln
    #
    # Reorder the list to be on the following form:
    #
    #   L0 -> Ln -> L1 -> Ln - 1 -> L2 -> Ln - 2 -> ...
    #
    # You may not modify the values in the list's nodes. Only nodes themselves may be changed.
    #
    # Examples:
    # Input: head = [1, 2, 3, 4]
    # Output: [1, 4, 2, 3]
    #
    # Input: head = [1, 2, 3, 4, 5]
    # Output: [1, 5, 2, 4, 3]
    #
    # @param {ListNode} head
    # @return {nil}
    def reorder_list(head)
      return head if !head.next

      reverse = ->(hd) {
        node = hd

        while node.next
          p_hd = hd
          n_hd = node.next

          node.next = n_hd.next
          n_hd.next = p_hd

          hd = n_hd
        end

        hd
      }

      merge = ->(l, r) {
        s = ListNode.new(nil)

        node = s
        flip = true

        while l || r
          if flip
            node.next = l
            l = l.next
          else
            node.next = r
            r = r.next
          end

          node = node.next
          flip = !flip
        end

        s.next
      }

      p = nil
      i = head
      j = head

      while j
        p = i
        i = i.next
        j = j&.next&.next
      end

      j = reverse.call(i)

      i = head
      p.next = nil

      merge.call(i, j)

      nil
    end
  end
end
