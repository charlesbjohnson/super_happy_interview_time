# frozen_string_literal: true

module LeetCode
  # 235. Lowest Common Ancestor of a Binary Search Tree
  module LC235
    # Description:
    # Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
    #
    # According to the definition of LCA on Wikipedia:
    # “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants
    # (where we allow a node to be a descendant of itself).”
    #
    # Examples:
    # Input: root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5], p = 2, q = 8
    # Output: 6
    #
    # Input: root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5], p = 2, q = 4
    # Output: 2
    #
    # Input: root = [2, 1], p = 2, q = 1
    # Output: 2
    #
    # @param {TreeNode} root
    # @param {TreeNode} p
    # @param {TreeNode} q
    # @return {TreeNode}
    def lowest_common_ancestor(root, p, q)
      result = private_methods.grep(/^lowest_common_ancestor_\d+$/).map { |m| send(m, root, p, q) }.uniq { |v| v.val }
      result.length == 1 ? result[0] : raise
    end

    private

    def lowest_common_ancestor_1(root, p, q)
      range = Range.new(*[p.val, q.val].sort)

      rec = ->(node) {
        return node if range.cover?(node.val)

        if node.left && node.val > range.end
          rec.call(node.left)
        elsif node.right && node.val < range.begin
          rec.call(node.right)
        end
      }

      rec.call(root)
    end

    def lowest_common_ancestor_2(root, p, q)
      range = Range.new(*[p.val, q.val].sort)
      stack = [root]

      until stack.empty?
        node = stack.pop

        return node if range.cover?(node.val)

        if node.val > range.end && node.left
          stack.push(node.left)
        elsif node.val < range.begin && node.right
          stack.push(node.right)
        end
      end

      raise
    end
  end
end
