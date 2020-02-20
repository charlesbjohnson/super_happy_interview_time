# typed: true
# frozen_string_literal: true

# had to look this up. pretty tricky but made sense
module CTCI
  module C2
    module P6
      # Given a circular linked list, implement an algorithm
      # which returns the node at the beginning of the loop.
      def find_loop
        slow = @head.next
        fast = @head.next
        while fast&.next
          slow = slow.next
          fast = fast.next.next
          break if slow == fast
        end

        return nil unless fast&.next

        slow = @head.next
        while slow != fast
          slow = slow.next
          fast = fast.next
        end

        slow
      end
    end
  end
end
