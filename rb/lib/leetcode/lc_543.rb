# frozen_string_literal: true

module LeetCode
  # 543. Diameter of Binary Tree
  module LC543
    TreeNode = Struct.new(:val, :left, :right)

    def diameter_of_binary_tree_recurse(tree, max)
      return [0, 0] if !tree || (!tree.left && !tree.right)

      left_no_cross = -1
      right_no_cross = -1

      if tree.left
        left_no_cross, left_cross = diameter_of_binary_tree_recurse(tree.left, max)
        max[0] = left_cross if left_cross > max[0]
      end

      if tree.right
        right_no_cross, right_cross = diameter_of_binary_tree_recurse(tree.right, max)
        max[0] = right_cross if right_cross > max[0]
      end

      cross = left_no_cross + right_no_cross + 2
      max[0] = cross if cross > max[0]

      [[left_no_cross + 1, right_no_cross + 1].max, cross]
    end

    # Description:
    # Given a binary tree, compute the length of the diameter of the tree.
    # The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
    #
    # Examples:
    # Input:
    #       1
    #      / \
    #     2   3
    #    / \
    #   4   5
    # Output: 3
    # Explanation: 4->2->1->3 or 5->2->1->3
    #
    # Notes:
    # - The length of path between two nodes is represented by the number of edges between them.
    #
    # @param tree {TreeNode}
    # @return {Integer}
    def diameter_of_binary_tree(tree)
      [0].tap do |max|
        diameter_of_binary_tree_recurse(tree, max)
      end.first
    end
  end
end
