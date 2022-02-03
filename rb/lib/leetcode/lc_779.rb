# frozen_string_literal: true

module LeetCode
  # 779. K-th Symbol in Grammar
  module LC779
    # Description:
    # We build a table of n rows (1-indexed).
    #
    # We start by writing 0 in the 1st row. Now in every subsequent row,
    # we look at the previous row and replace each occurrence of 0 with 01, and each occurrence of 1 with 10.
    # - For example, for n = 3, the 1st row is 0, the 2nd row is 01, and the 3rd row is 0110.
    #
    # Given two integer n and k, return the kth (1-indexed) symbol in the nth row of a table of n rows.
    #
    # Examples:
    # Input: n = 1, k = 1
    # Output: 0
    #
    # Input: n = 2, k = 1
    # Output: 0
    #
    # Input: n = 2, k = 2
    # Output: 1
    #
    # @param {Integer} n
    # @param {Integer} k
    # @return {Integer}
    def kth_grammar(n, k)
      return 0 if n == 1

      if kth_grammar(n - 1, (k + 1) / 2) == 0
        k % 2 == 1 ? 0 : 1
      else
        k % 2 == 1 ? 1 : 0
      end
    end
  end
end
