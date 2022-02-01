# frozen_string_literal: true

module LeetCode
  # 378. Kth Smallest Element in a Sorted Matrix
  module LC378
    Heap = Helpers::LeetCode::Heap

    # Description:
    # Given an n x n matrix where each of the rows and columns is sorted in ascending order,
    # return the kth smallest element in the matrix.
    #
    # Note that it is the kth smallest element in the sorted order, not the kth distinct element.
    #
    # You must find a solution with a memory complexity better than O(n2).
    #
    # Examples:
    # Input: matrix = [[1, 5, 9], [10, 11, 13], [12, 13, 15]], k = 8
    # Output: 13
    #
    # Input: matrix = [[-5]], k = 1
    # Output: -5
    #
    # @param {Array<Array<Integer>>} matrix
    # @param {Integer} k
    # @return {Integer}
    def kth_smallest(matrix, k)
      heap = Heap.new { |a, b| b[0] <=> a[0] }

      matrix.each_index { |r|
        heap.push([matrix[r][0], [r, 0]])
      }

      while k > 1
        _, (r, c) = heap.pop
        heap.push([matrix[r][c + 1], [r, c + 1]]) if c + 1 < matrix[r].length
        k -= 1
      end

      heap.pop[0]
    end
  end
end
