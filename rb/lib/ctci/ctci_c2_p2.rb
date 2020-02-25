# typed: false
# frozen_string_literal: true

require "ostruct"

module CTCI
  module C2
    module P2
      # Implement an algorithm to find the kth to last element
      # of a singly linked list
      def from_last(index)
        return nil if index.negative? || index > size

        result = OpenStruct.new(node: nil)
        r_from_last(@head.next, index, result)
        result.node&.data
      end

      private

      def r_from_last(cursor, index, result)
        return 0 unless cursor

        pos = r_from_last(cursor.next, index, result)
        result.node = cursor if index == pos
        pos + 1
      end
    end
  end
end
