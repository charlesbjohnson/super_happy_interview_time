# frozen_string_literal: true

module LeetCode
  # 226. Invert Binary Tree
  module LC226
    # Description:
    # Given the root of a binary tree, invert the tree, and return its root.
    #
    # Examples:
    # Input: root = [4, 2, 7, 1, 3, 6, 9]
    # Output: [4, 7, 2, 9, 6, 3, 1]
    #
    # Input: root = [2, 1, 3]
    # Output: [2, 3, 1]
    #
    # Input: root = []
    # Output: []
    # @param {TreeNode} root
    # @return {TreeNode}
    def invert_tree(root)
      result = private_methods.grep(/^invert_tree_\d+$/).map { |m| send(m, root.clone) }.uniq { |v| v&.val }
      result.length == 1 ? result[0] : raise
    end

    private

    def invert_tree_1(root)
      rec = ->(node) {
        return if !node

        node.left, node.right = node.right, node.left

        rec.call(node.left)
        rec.call(node.right)

        node
      }

      rec.call(root)
    end

    def invert_tree_2(root)
      queue = [root]

      until queue.empty?
        node = queue.shift

        next if !node

        node.left, node.right = node.right, node.left

        queue.push(node.left)
        queue.push(node.right)
      end

      root
    end
  end
end
