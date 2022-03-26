# frozen_string_literal: true

module LeetCode
  # 230. Kth Smallest Element in a BST
  module LC230
    # Description:
    # Given the root of a binary search tree, and an integer k,
    # return the kth smallest value (1-indexed) of all the values of the nodes in the tree.
    #
    # Follow up: If the BST is modified often (i.e., we can do insert and delete operations)
    # and you need to find the kth smallest frequently, how would you optimize?
    #
    # Examples:
    # Input: root = [3, 1, 4, null, 2], k = 1
    # Output: 1
    #
    # Input: root = [5, 3, 6, 2, 4, null, null, 1], k = 3
    # Output: 3
    #
    # @param {TreeNode} root
    # @param {Integer} k
    # @return {Integer}
    def kth_smallest(root, k)
      result = private_methods.grep(/^kth_smallest_\d+$/).map { |m| send(m, root, k) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def kth_smallest_1(root, k)
      result = []

      rec = ->(node) {
        return if !node

        rec.call(node.left)
        result.push(node.val)
        rec.call(node.right)
      }

      rec.call(root)
      result[k - 1]
    end

    def kth_smallest_2(root, k)
      stack = [[root, false]]

      until stack.empty?
        node, backtrack = stack.pop

        if backtrack || (!node.left && !node.right)
          k -= 1
          return node.val if k == 0
          next
        end

        stack.push([node.right, false]) if node.right
        stack.push([node, true]) if node.left || node.right
        stack.push([node.left, false]) if node.left
      end

      raise
    end
  end
end
