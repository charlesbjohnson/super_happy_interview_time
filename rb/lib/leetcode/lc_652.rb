# frozen_string_literal: true

module LeetCode
  # 652. Find Duplicate Subtrees
  module LC652
    # Description:
    # Given the root of a binary tree, return all duplicate subtrees.
    # For each kind of duplicate subtrees, you only need to return the root node of any one of them.
    #
    # Two trees are duplicate if they have the same structure with the same node values.
    #
    # Examples:
    # Input: root = [1, 2, 3, 4, null, 2, 4, null, null, 4]
    # Output: [[2, 4], [4]]
    #
    # Input: root = [2, 1, 1]
    # Output: [[1]]
    #
    # Input: root = [2, 2, 2, 3, null, 3, null]
    # Output: [[2, 3], [3]]
    #
    # @param {TreeNode} root
    # @return {Array<TreeNode>}
    def find_duplicate_subtrees(root)
      traversal = Hash.new("#")
      stack = [[root, false]]

      seen = Hash.new(0)
      result = []

      until stack.empty?
        node, visited = stack.pop

        if visited || (!node.left && !node.right)
          key = [traversal[node.left], traversal[node.right], node.val].join(",")

          result.unshift(node) if seen[key] == 1
          seen[key] += 1

          traversal[node] = key
        else
          stack.push([node, true])
          stack.push([node.right, false]) if node.right
          stack.push([node.left, false]) if node.left
        end
      end

      result
    end
  end
end
