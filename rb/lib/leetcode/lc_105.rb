# frozen_string_literal: true

module LeetCode
  # 105. Construct Binary Tree from Preorder and Inorder Traversal
  module LC105
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree
    # and inorder is the inorder traversal of the same tree, construct and return the binary tree.
    #
    # Examples:
    # Input: preorder = [3, 9, 20, 15, 7], inorder = [9, 3, 15, 20, 7]
    # Output: [3, 9, 20, null, null, 15, 7]
    #
    # Input: preorder = [-1], inorder = [-1]
    # Output: [-1]
    #
    # @param {Array<Integer>} preorder
    # @param {Array<Integer>} inorder
    # @return {TreeNode}
    def build_tree(preorder, inorder)
      i = 0
      hash = inorder.each_index.with_object({}) { |i, h| h[inorder[i]] = i }

      rec = ->(lo, hi) {
        return if lo > hi

        mid = hash[preorder[i]]
        i += 1

        TreeNode.new(
          preorder[i - 1],
          rec.call(lo, mid - 1),
          rec.call(mid + 1, hi)
        )
      }

      rec.call(0, inorder.length - 1)
    end
  end
end
