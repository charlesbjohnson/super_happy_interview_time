# typed: true
# frozen_string_literal: true

require_relative("single_node")

module DataStructures
  class Queue
    include(Enumerable)

    def initialize
      @head = SingleNode.new
      @tail = @head
    end

    def size
      to_a.size
    end

    def each(&block)
      enum = Enumerator.new { |y|
        cursor = @head
        while cursor.next
          y << cursor.data
          cursor = cursor.next
        end
      }

      block_given? ? enum.each(&block) : enum
    end

    def peek
      @head.data
    end

    def enqueue(data)
      @tail.data = data
      new = SingleNode.new
      @tail.next = new
      @tail = new
    end

    def dequeue
      return nil if @head.next.nil?

      doomed = @head
      @head = doomed.next
      doomed.next = nil

      doomed.data
    end
  end
end
