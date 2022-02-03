# frozen_string_literal: true

module Helpers
  module LeetCode
    class BitSet
      # @param {Integer} data
      def initialize(data)
        self.data = data
      end

      # @yield [v]
      # @yieldparam {Integer} v
      def each(&block)
        (0...data.bit_length).each { |i| block.call(i) if data[i] == 1 }
        self
      end

      # @return {Boolean}
      def empty?
        data == 0
      end

      # @param {Integer} num
      # @return {BitSet}
      def add(num)
        self.data |= 1 << num
        self
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
