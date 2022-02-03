# frozen_string_literal: true

module LeetCode
  # 77. Combinations
  module LC77
    # Description:
    # Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].
    # You may return the answer in any order.
    #
    # Examples:
    # Input: n = 4, k = 2
    # Output:
    # [
    #   [2, 4],
    #   [3, 4],
    #   [2, 3],
    #   [1, 2],
    #   [1, 3],
    #   [1, 4],
    # ]
    #
    # Input: n = 1, k = 1
    # Output: [[1]]
    #
    # @param {Integer} n
    # @param {Integer} k
    # @return {Array<Array<Integer>>}
    def combine(n, k)
      result = []
      stack = [[1, []]]

      until stack.empty?
        i, current = stack.pop

        if current.length == k
          result.push(current)
          next
        end

        if i <= n && (n - i + 1) >= k - current.length
          stack.push([i + 1, current])
          stack.push([i + 1, current + [i]])
        end
      end

      result
    end
  end
end
