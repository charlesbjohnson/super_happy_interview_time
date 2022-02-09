# frozen_string_literal: true

module LeetCode
  # 450. Delete Node in a BST
  module LC450
    # Description:
    # Given a root node reference of a BST and a key, delete the node with the given key in the BST.
    # Return the root node reference (possibly updated) of the BST.
    #
    # Basically, the deletion can be divided into two stages:
    # 1. Search for a node to remove.
    # 2. If the node is found, delete the node.
    #
    # Follow up: Could you solve it with time complexity O(height of tree)?
    #
    # Examples:
    # Input: root = [5, 3, 6, 2, 4, null, 7], key = 3
    # Output: [5, 4, 6, 2, null, null, 7]
    #
    # Input: root = [5, 3, 6, 2, 4, null, 7], key = 0
    # Output: [5, 3, 6, 2, 4, null, 7]
    #
    # Input: root = [], key = 0
    # Output: []
    #
    # @param {TreeNode} root
    # @param {Integer} key
    # @return {TreeNode}
    def delete_node(root, key)
      return if !root

      case key <=> root.val
      when -1
        root.left = delete_node(root.left, key)
      when 1
        root.right = delete_node(root.right, key)
      when 0
        if !root.left && !root.right
          root = nil
        elsif root.left && !root.right
          root = root.left
        elsif !root.left && root.right
          root = root.right
        else
          doomed = root

          root = find_min_node(doomed.right)
          root.right = delete_node(doomed.right, root.val)
          root.left = doomed.left
        end
      end

      root
    end

    private

    def find_min_node(root)
      root = root.left while root.left
      root
    end
  end
end
