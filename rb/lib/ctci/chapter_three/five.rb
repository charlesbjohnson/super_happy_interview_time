# frozen_string_literal: true

module CTCI
  module ChapterThree
    class Five
      # Implement a MyQueue class which implements a queue using two stacks.
      def initialize
        @enqueue = DataStructures::Stack.new
        @dequeue = DataStructures::Stack.new
      end

      def size
        @enqueue.size + @dequeue.size
      end

      def peek
        dump_enqueue

        @dequeue.peek
      end

      def enqueue(data)
        @enqueue.push(data)
      end

      def dequeue
        dump_enqueue

        @dequeue.pop
      end

      private

      def dump_enqueue
        return unless @dequeue.size.zero?

        @dequeue.push(@enqueue.pop) until @enqueue.empty?
      end
    end
  end
end
