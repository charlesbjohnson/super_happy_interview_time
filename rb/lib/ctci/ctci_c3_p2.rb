# typed: true
# frozen_string_literal: true

require 'data_structures/stack'
require 'data_structures/single_node'

module CTCI
  module C3
    class P2 < DataStructures::Stack
      # How would you design a stack which, in addition to
      # push and pop, also has a function min which returns
      # the minimum element? Push, pop, and min should all
      # operate in O(1) time.
      def initialize
        @head = MinNode.new
      end

      def my_min
        @head.min
      end

      def push(data)
        is_min = @head.min.nil? || data < @head.min

        new = MinNode.new(data, n: @head)
        new.min = is_min ? data : @head.min

        @head = new
      end
    end

    class MinNode < DataStructures::SingleNode
      attr_accessor :min
    end
  end
end
