# frozen_string_literal: true

module LeetCode
  # 295. Find Median from Data Stream
  module LC295
    MaxHeap = Helpers::LeetCode::MaxHeap
    MinHeap = Helpers::LeetCode::MinHeap

    # Description:
    # The median is the middle value in an ordered integer list.
    # If the size of the list is even, there is no middle value and the median is the mean of the two middle values.
    # - For example, for arr = [2,3,4], the median is 3.
    # - For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
    #
    # Implement the MedianFinder class:
    # - MedianFinder()       initializes the MedianFinder object.
    # - void addNum(int num) adds the integer num from the data stream to the data structure.
    # - double findMedian()  returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
    #
    # Examples:
    # Input:
    # ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
    # [[], [1], [2], [], [3], []]
    # Output:
    # [null, null, null, 1.5, null, 2.0]
    #
    class MedianFinder
      def initialize
        self.max = MaxHeap.new
        self.min = MinHeap.new
      end

      # @param {Integer} num
      def add_num(num)
        max.push(num)

        if !max.empty? && !min.empty? && max.max >= min.min
          min.push(max.pop)
        end

        if max.size - min.size >= 2
          min.push(max.pop)
        elsif min.size - max.size >= 2
          max.push(min.pop)
        end

        nil
      end

      # @return {Integer}
      def find_median
        if max.size == min.size
          (max.max + min.min).fdiv(2)
        elsif max.size > min.size
          max.max.to_f
        else
          min.min.to_f
        end
      end

      private

      attr_accessor(:min, :max)
    end
  end
end
