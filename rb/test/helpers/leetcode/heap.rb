# frozen_string_literal: true

module Helpers
  module LeetCode
    class Heap
      # @param {Array<Comparable>} values
      # @yield [Array(Comparable, Comparable)]
      def initialize(values = [], &priority)
        self.values = values.clone
        self.priority = priority || ->(a, b) { b <=> a }

        heapify
      end

      # @return {Boolean}
      def empty?
        size == 0
      end

      # @return {Comparable}
      def peek
        values.first
      end

      # @return {Comparable}
      def delete(v)
        i = values.find_index(v)
        return unless i

        values[i], values[-1] = values[-1], values[i]
        result = values.pop
        sink(i)

        result
      end

      # @return {Comparable}
      def pop
        return if values.empty?

        values[0], values[-1] = values[-1], values[0]
        result = values.pop
        sink(0)

        result
      end

      # @param {Comparable} v
      def push(v)
        values.push(v)
        swim(size - 1)

        nil
      end

      # @return {Integer}
      def size
        values.size
      end

      private

      attr_accessor(:values, :priority)

      def sink(i)
        while i < (size / 2)
          l, r = children(i)
          swap = r && priority.call(values[r], values[l]) == 1 ? r : l

          if priority.call(values[swap], values[i]) == 1
            values[i], values[swap] = values[swap], values[i]
            i = swap
          else
            break
          end
        end
      end

      def swim(i)
        while i > 0
          p = parent(i)

          if priority.call(values[i], values[p]) == 1
            values[i], values[p] = values[p], values[i]
            i = p
          else
            break
          end
        end
      end

      def heapify
        (1...values.length).reverse_each { |i| sink(parent(i)) }
      end

      def parent(i)
        if i == 0
          nil
        else
          i % 2 == 0 ? (i / 2) - 1 : (i / 2)
        end
      end

      def children(i)
        l = ((i + 1) * 2) - 1
        r = l + 1

        [
          l < size ? l : nil,
          r < size ? r : nil
        ].compact
      end
    end

    class MaxHeap < Heap
      def initialize(*)
        super { |a, b| a <=> b }
      end

      def max
        peek
      end
    end

    class MinHeap < Heap
      def initialize(*)
        super { |a, b| b <=> a }
      end

      def min
        peek
      end
    end
  end
end
