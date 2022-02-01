# frozen_string_literal: true

module LeetCode
  # 703. Kth Largest Element in a Stream
  module LC703
    MinHeap = Helpers::LeetCode::MinHeap

    # Description:
    # Design a class to find the kth largest element in a stream.
    # Note that it is the kth largest element in the sorted order, not the kth distinct element.
    #
    # Implement KthLargest class:
    # - KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
    # - int add(int val) Appends the integer val to the stream and returns the element representing the kth largest element in the stream.
    #
    # Examples:
    # Input:
    # ["KthLargest", "add", "add", "add", "add", "add"]
    # [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
    # Output:
    # [null, 4, 5, 5, 8, 8]
    #
    class KthLargest
      # @param {Integer} k
      # @param {Array<Integer>} numx
      def initialize(k, nums)
        self.k = k
        self.heap = MinHeap.new

        nums.each { |num| push(num) }
      end

      # @param {Integer} val
      # @return {Integer}
      def add(val)
        push(val)
        heap.min
      end

      private

      def push(num)
        heap.push(num)
        heap.pop if heap.size > k
      end

      attr_accessor(:k, :heap)
    end
  end
end
