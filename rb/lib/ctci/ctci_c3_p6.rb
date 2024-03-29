# frozen_string_literal: true

module CTCI
  module C3
    module P6
      # Write a program to sort a stack in ascending order (with biggest
      # items on top). You may use at most one additional stack to hold
      # items, but you may not copy the ements into any other data structure
      # (such as an array). The stack supports the following operations:
      # push, pop, peek, and isEmpty.
      def sort_ascending(stack)
        result = DataStructures::Stack.new

        until stack.size.zero?
          popped = stack.pop
          stack.push(result.pop) until in_sorted_position?(popped, result)
          result.push(popped)
        end

        result
      end

      private

      def in_sorted_position?(item, to)
        to.size.zero? || item > to.peek
      end
    end
  end
end
