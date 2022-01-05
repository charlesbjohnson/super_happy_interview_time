# frozen_string_literal: true

module LeetCode
  # 155. Min Stack
  module LC155
    # Description:
    # Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
    #
    # Implement the MinStack class:
    # - MinStack()         initializes the stack object.
    # - void push(int val) pushes the element val onto the stack.
    # - void pop()         removes the element on the top of the stack.
    # - int top()          gets the top element of the stack.
    # - int getMin()       retrieves the minimum element in the stack.
    #
    # Examples:
    # Input:
    # ["MinStack", "push", "push", "push", "getMin", "pop", "top", "getMin"]
    # [[], [-2], [0], [-3], [], [], [], []]
    #
    # Output:
    # [null, null, null, null, -3, null, 0, -2]
    #
    class MinStack
      def initialize
        self.vals = []
        self.mins = []
      end

      # @param {Integer} val
      # @return {nil}
      def push(val)
        vals.push(val)
        mins.push([val, get_min].compact.min)

        nil
      end

      # @return {nil}
      def pop
        vals.pop
        mins.pop

        nil
      end

      # @return {Integer}
      def top
        vals.last
      end

      # @return {Integer}
      def get_min
        mins.last
      end

      private

      attr_accessor(:vals, :mins)
    end
  end
end
