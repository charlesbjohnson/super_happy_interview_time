# typed: true
# frozen_string_literal: true

module LeetCode
  # 96. Unique Binary Search Trees
  module LC96
    # Description:
    # Given n, how many structurally unique BST's (binary search trees) that store values 1...n?
    #
    # Examples:
    # Input: 3
    # Output: 5
    # Explanation:
    #   1         3     3      2      1
    #    \       /     /      / \      \
    #     3     2     1      1   3      2
    #    /     /       \                 \
    #   2     1         2                 3
    #
    # @param n {Integer}
    # @return {Integer}
    def num_trees(n)
      return 0 if n <= 0
      return 1 if n < 2

      cache = Array.new(n)
      cache[0] = 0
      cache[1] = 1

      (2..n).each do |num_nodes|
        count = (0...num_nodes).each.reduce(0) { |sum, i|
          next sum + cache[num_nodes - 1] if i.zero? || i == (num_nodes - 1)

          sum + (cache[i] * cache[num_nodes - i - 1])
        }

        cache[num_nodes] = count
      end

      cache[n]
    end
  end
end
