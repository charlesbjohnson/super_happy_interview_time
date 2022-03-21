# frozen_string_literal: true

module LeetCode
  # 2022. Convert 1D Array Into 2D Array
  module LC2022
    # Description:
    # You are given a 0-indexed 1-dimensional (1D) integer array original, and two integers, m and n.
    # You are tasked with creating a 2-dimensional (2D) array with m rows and n columns using all the elements from original.
    #
    # The elements from indices 0 to n - 1 (inclusive) of original should form the first row of the constructed 2D array,
    # the elements from indices n to 2 * n - 1 (inclusive) should form the second row of the constructed 2D array, and so on.
    #
    # Return an m x n 2D array constructed according to the above procedure, or an empty 2D array if it is impossible.
    #
    # Examples:
    # Input: original = [1, 2, 3, 4], m = 2, n = 2
    # Output: [[1, 2], [3, 4]]
    #
    # Input: original = [1, 2, 3], m = 1, n = 3
    # Output: [[1, 2, 3]]
    #
    # Input: original = [1, 2], m = 1, n = 1
    # Output: []
    #
    # @param {Array<Integer>} original
    # @param {Integer} m
    # @param {Integer} n
    # @return {Array<Array<Integer>>}
    def construct2_d_array(original, m, n)
      return [] if original.length != m * n

      result = Array.new(m) { Array.new(n) }

      (0...original.length).each { |i|
        result[i / n][i % n] = original[i]
      }

      result
    end
  end
end
