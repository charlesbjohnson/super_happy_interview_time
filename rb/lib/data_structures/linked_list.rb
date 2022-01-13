# typed: false
# frozen_string_literal: true

require_relative("single_node")

module DataStructures
  class LinkedList
    include(Enumerable)

    def initialize
      @head = SingleNode.new
      @tail = @head
    end

    def size
      to_a.size
    end

    def empty?
      size.zero?
    end

    def [](index)
      cursor = @head.next
      index.times { cursor = cursor.next }
      cursor&.data
    end

    def each(&block)
      enum = Enumerator.new { |y|
        cursor = @head.next
        while cursor
          y << cursor.data
          cursor = cursor.next
        end
      }

      block ? enum.each(&block) : enum
    end

    def append(data)
      @tail.next = SingleNode.new
      @tail = @tail.next
      @tail.data = data
    end

    def insert(index, data)
      if index == size
        append(data)
        return
      end

      cursor = @head
      i = 0
      while cursor && i < index
        cursor = cursor.next
        i += 1
      end

      cursor.next = SingleNode.new(data, n: cursor.next)
    end

    def remove
      cursor = @head
      cursor = cursor.next until cursor.next == @tail

      result = @tail.data
      @tail = cursor
      @tail.next = nil

      result
    end

    def delete(index)
      cursor = @head
      index.times { cursor = cursor.next }
      doomed = cursor.next
      cursor.next = doomed.next
      doomed.next = nil

      doomed.data
    end

    def index(of)
      result = nil
      index = 0
      cursor = @head.next
      while cursor
        if cursor.data == of
          result = index
          break
        end

        cursor = cursor.next
        index += 1
      end

      result
    end
  end
end
