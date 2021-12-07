# frozen_string_literal: true

module LeetCode
  # 437. Path Sum III
  module LC437
    TreeNode = Struct.new(:val, :left, :right)

    def path_sum_recurse(tree, sum, count, counting)
      return unless tree

      count[0] += 1 if (sum - tree.val).zero?

      unless counting
        path_sum_recurse(tree.left, sum, count, false)
        path_sum_recurse(tree.right, sum, count, false)
      end

      path_sum_recurse(tree.left, sum - tree.val, count, true)
      path_sum_recurse(tree.right, sum - tree.val, count, true)
    end

    # Description:
    # You are given a binary tree in which each node contains an integer value.
    # Find the number of paths that sum to a given value.
    # The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
    #
    # Examples:
    # Input:
    #        tree, sum = 8
    #         10
    #        /  \
    #       5   -3
    #      / \    \
    #     3   2   11
    #    / \   \
    #   3  -2   1
    # Output: 3
    # Explanation:
    #   1.  5 ->  3
    #   2.  5 ->  2 -> 1
    #   3. -3 -> 11
    #
    # Notes:
    # - The tree has no more than 1,000 nodes.
    # - The values are in the range -1,000,000 to 1,000,000.
    #
    # @param tree {TreeNode}
    # @param sum {Integer}
    # @return {Integer}
    def path_sum(tree, sum)
      [0].tap { |count|
        path_sum_recurse(tree, sum, count, false)
      }.first
    end
  end
end
