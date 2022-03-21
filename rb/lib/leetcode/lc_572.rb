# frozen_string_literal: true

module LeetCode
  # 572. Subtree of Another Tree
  module LC572
    # Description:
    # Given the roots of two binary trees root and subRoot,
    # return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.
    #
    # A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants.
    # The tree tree could also be considered as a subtree of itself.
    #
    # Examples:
    # Input: root = [3, 4, 5, 1, 2], subRoot = [4, 1, 2]
    # Output: true
    #
    # Input: root = [3, 4, 5, 1, 2, null, null, null, null, 0], subRoot = [4, 1, 2]
    # Output: false
    # @param {TreeNode} root
    # @param {TreeNode} sub_root
    # @return {Boolean}
    def is_subtree(root, sub_root)
      is_same = ->(l, r) {
        return true if !l && !r
        return false if l && !r || !l && r

        l.val == r.val && is_same.call(l.left, r.left) && is_same.call(l.right, r.right)
      }

      rec = ->(node) {
        return false if !node
        return true if is_same.call(node, sub_root)

        rec.call(node.left) || rec.call(node.right)
      }

      rec.call(root)
    end
  end
end
