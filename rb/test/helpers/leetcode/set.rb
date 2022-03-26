# frozen_string_literal: true

module Helpers
  module LeetCode
    class BitSet
      include(Enumerable)

      # @param {Integer} data
      def initialize(data = 0)
        self.data = data
      end

      # @return {Boolean}
      def empty?
        data == 0
      end

      # @return {Boolean}
      def include?(num)
        data & (1 << num) != 0
      end

      # @yield [v]
      # @yieldparam {Integer} v
      def each(&block)
        (0...data.bit_length).filter { |i| data[i] == 1 }.each(&block)
      end

      # @param {Integer} num
      # @return {BitSet}
      def add(num)
        self.data |= 1 << num
        self
      end

      # @param {Integer} num
      # @return {Boolean}
      def add?(num)
        if !include?(num)
          add(num)
          return true
        end

        false
      end

      # @param {Integer} num
      # @return {BitSet}
      def delete(num)
        self.data &= ~(1 << num)
        self
      end

      # @param {BitSet} other
      # @return {BitSet}
      def &(other)
        self.class.new(data & other.send(:data))
      end

      private

      attr_accessor(:data)
    end
  end
end
