# frozen_string_literal: true

module LeetCode
  # 297. Serialize and Deserialize Binary Tree
  module LC297
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # Serialization is the process of converting a data structure or object into a sequence of bits
    # so that it can be stored in a file or memory buffer, or transmitted across a network connection link
    # to be reconstructed later in the same or another computer environment.
    #
    # Design an algorithm to serialize and deserialize a binary tree.
    # There is no restriction on how your serialization/deserialization algorithm should work.
    # You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized
    # to the original tree structure.
    #
    # Examples:
    # Input: root = [1, 2, 3, null, null, 4, 5]
    # Output: [1, 2, 3, null, null, 4, 5]
    #
    # Input: root = []
    # Output: []
    #
    # @param {TreeNode} root
    # @return {String}
    def serialize(root)
      stack = [root]
      values = []

      until stack.empty?
        node = stack.shift

        values.push(node&.val)
        if node
          stack.push(node.left)
          stack.push(node.right)
        end
      end

      values.join(",").gsub(/,+$/, "")
    end

    # @param {String} data
    # @return {TreeNode}
    def deserialize(data)
      return if data == ""

      nodes = data.split(",").map { |s| s == "" ? nil : TreeNode.new(s.to_i) }
      nodes.reduce(0) { |i, node|
        next i unless node

        left = (i * 2) + 1
        right = left + 1

        node.left = nodes[left] if left < nodes.length
        node.right = nodes[right] if right < nodes.length

        i + 1
      }

      nodes.first
    end
  end
end
