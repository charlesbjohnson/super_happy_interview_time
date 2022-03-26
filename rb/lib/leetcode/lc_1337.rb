# frozen_string_literal: true

module LeetCode
  # 1337. The K Weakest Rows in a Matrix
  module LC1337
    Heap = Helpers::LeetCode::Heap

    # Description:
    # You are given an m x n binary matrix mat of 1's (representing soldiers) and 0's (representing civilians).
    # The soldiers are positioned in front of the civilians. That is, all the 1's will appear to the left of all the 0's in each row.
    #
    # A row i is weaker than a row j if one of the following is true:
    # - The number of soldiers in row i is less than the number of soldiers in row j.
    # - Both rows have the same number of soldiers and i < j.
    #
    # Return the indices of the k weakest rows in the matrix ordered from weakest to strongest.
    #
    # Examples:
    # Input: mat =
    # [[1, 1, 0, 0, 0],
    #  [1, 1, 1, 1, 0],
    #  [1, 0, 0, 0, 0],
    #  [1, 1, 0, 0, 0],
    #  [1, 1, 1, 1, 1]],
    # k = 3
    # Output: [2, 0, 3]
    #
    # Input: mat =
    # [[1, 0, 0, 0],
    #  [1, 1, 1, 1],
    #  [1, 0, 0, 0],
    #  [1, 0, 0, 0]],
    # k = 2
    # Output: [0, 2]
    #
    # @param {Array<Array<Integer>>} mat
    # @param {Integer} k
    # @return {Array<Integer>}
    def k_weakest_rows(mat, k)
      heap = Heap.new { |a, b|
        a[0] != b[0] ? b[0] <=> a[0] : b[1] <=> a[1]
      }

      mat.each_index { |r|
        heap.push([(mat[r].index(0) || mat[r].length), r])
        heap.pop if heap.size > k
      }

      heap.size.times.map { heap.pop[1] }.reverse
    end
  end
end
