# frozen_string_literal: true

module LeetCode
  # 100. Same Tree
  module LC100
    # Description:
    # Given the roots of two binary trees p and q, write a function to check if they are the same or not.
    # Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
    #
    # Examples:
    # Input: p = [1, 2, 3], q = [1, 2, 3]
    # Output: true
    #
    # Input: p = [1, 2], q = [1, null, 2]
    # Output: false
    #
    # Input: p = [1, 2, 1], q = [1, 1, 2]
    # Output: false
    #
    # @param {TreeNode} p
    # @param {TreeNode} q
    # @return {Boolean}
    def is_same_tree(p, q)
      result = private_methods.grep(/^is_same_tree_\d+$/).map { |m| send(m, p, q) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def is_same_tree_1(p, q)
      rec = ->(l, r) {
        return true if !l && !r
        return false if l && !r || !l && r

        l.val == r.val && rec.call(l.left, r.left) && rec.call(l.right, r.right)
      }

      rec.call(p, q)
    end

    def is_same_tree_2(p, q)
      stack = [[p, q]]

      until stack.empty?
        l, r = stack.pop

        next if !l && !r
        return false if !l && r || l && !r || l.val != r.val

        stack.push([l.right, r.right])
        stack.push([l.left, r.left])
      end

      true
    end
  end
end
