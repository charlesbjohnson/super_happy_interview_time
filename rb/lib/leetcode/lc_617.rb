# frozen_string_literal: true

module LeetCode
  # 617. Merge Two Binary Trees
  module LC617
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # You are given two binary trees root1 and root2.
    #
    # Imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
    # You need to merge the two trees into a new binary tree.
    # The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node.
    # Otherwise, the NOT null node will be used as the node of the new tree.
    #
    # Return the merged tree.
    #
    # Note: The merging process must start from the root nodes of both trees.
    #
    # Examples:
    # Input: root1 = [1, 3, 2, 5], root2 = [2, 1, 3, null, 4, null, 7]
    # Output: [3, 4, 5, 5, 4, null, 7]
    #
    # Input: root1 = [1], root2 = [1, 2]
    # Output: [2, 2]
    # @param {TreeNode} root1
    # @param {TreeNode} root2
    # @return {TreeNode}
    def merge_trees(root1, root2)
      result = private_methods.grep(/^merge_trees_\d+$/).map { |m| send(m, root1, root2) }.uniq { |v| v&.val }
      result.length == 1 ? result[0] : raise
    end

    private

    def merge_trees_1(root1, root2)
      rec = ->(l, r) {
        return if !l && !r

        TreeNode.new(
          [l&.val, r&.val].compact.sum,
          rec.call(l&.left, r&.left),
          rec.call(l&.right, r&.right)
        )
      }

      rec.call(root1, root2)
    end

    def merge_trees_2(root1, root2)
      return if !root1 && !root2

      result = TreeNode.new
      stack = [[root1, root2, result]]

      until stack.empty?
        l, r, node = stack.pop

        node.val = [l&.val, r&.val].compact.sum

        if l&.right || r&.right
          node.right = TreeNode.new
          stack.push([l&.right, r&.right, node.right])
        end

        if l&.left || r&.left
          node.left = TreeNode.new
          stack.push([l&.left, r&.left, node.left])
        end
      end

      result
    end
  end
end
