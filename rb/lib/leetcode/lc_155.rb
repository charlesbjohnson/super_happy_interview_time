# typed: true
# frozen_string_literal: true

module LeetCode
  # 155. Min Stack
  module LC155
    # Description:
    # Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
    # - push(x)   -- Push element x onto stack.
    # - pop()     -- Removes the element on top of the stack.
    # - top()     -- Get the top element.
    # - get_min() -- Retrieve the minimum element in the stack.
    class MinStack
      def initialize
        @vals = []
        @mins = []
      end

      def push(x)
        @vals.push(x)
        @mins.push(x) if @mins.empty? || x <= @mins.last

        nil
      end

      def pop
        @mins.pop if @vals.pop == @mins.last

        nil
      end

      def top
        @vals.last
      end

      def min
        @mins.last
      end

      alias get_min min
    end
  end
end
