# frozen_string_literal: true

module LeetCode
  # 236. Lowest Common Ancestor of a Binary Tree
  module LC236
    # Description:
    # Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
    #
    # According to the definition of LCA on Wikipedia:
    # “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants
    # (where we allow a node to be a descendant of itself).”
    #
    # Examples:
    # Input: root = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4], p = 5, q = 1
    # Output: 3
    #
    # Input: root = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4], p = 5, q = 4
    # Output: 5
    #
    # Input: root = [1, 2], p = 1, q = 2
    # Output: 1
    #
    # @param {TreeNode} root
    # @param {TreeNode} p
    # @param {TreeNode} q
    # @return {TreeNode}
    def lowest_common_ancestor(root, p, q)
      result = private_methods.grep(/^lowest_common_ancestor_\d+$/).map { |m| send(m, root, p, q) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def lowest_common_ancestor_1(root, p, q)
      rec = ->(node) {
        return if !node
        return node if node == p || node == q

        l = rec.call(node.left)
        r = rec.call(node.right)

        l && r ? node : l || r
      }

      rec.call(root)
    end

    def lowest_common_ancestor_2(root, p, q)
      hash = {root => nil}
      stack = [root]

      while !hash.key?(p) || !hash.key?(q)
        node = stack.pop

        if node.left
          hash[node.left] = node
          stack.push(node.left)
        end

        if node.right
          hash[node.right] = node
          stack.push(node.right)
        end
      end

      p_path = Set.new
      p_cursor = p

      while p_cursor
        p_path.add(p_cursor)
        p_cursor = hash[p_cursor]
      end

      q_path = Set.new
      q_cursor = q

      while q_cursor
        q_path.add(q_cursor)
        q_cursor = hash[q_cursor]
      end

      (p_path & q_path).first
    end
  end
end
