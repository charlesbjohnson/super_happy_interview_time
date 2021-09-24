# typed: true
# frozen_string_literal: true

module LeetCode
  # 297. Serialize and Deserialize Binary Tree
  module LC297
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Serialization is the process of converting a data structure or object into a
    # sequence of bits so that it can be stored in a file or memory buffer,
    # or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
    #
    # Design an algorithm to serialize and deserialize a binary tree.
    # There is no restriction on how your serialization/deserialization algorithm should work.
    # You just need to ensure that a binary tree can be serialized to a string and
    # this string can be deserialized to the original tree structure.
    #
    # Examples:
    # Input:
    #     1
    #    / \
    #   2   3
    #      / \
    #     4   5
    # Output: "[1, 2, 3, null, null, 4, 5]"
    #
    # Notes:
    # - You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
    # - Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
    #
    # @param tree {TreeNode}
    # @return {string}
    def serialize(tree)
      queue = [tree]
      value = []

      until queue.empty?
        node = queue.shift

        unless node
          value.push(nil)
          next
        end

        value.push(node.val)
        queue.push(node.left)
        queue.push(node.right)
      end

      value.map(&:to_s).join(",").gsub(/,+$/, "")
    end

    # @param data {String}
    # @return {TreeNode}
    def deserialize(data)
      return if data.empty?

      nodes = data.split(",").map { |s| s.empty? ? nil : TreeNode.new(s.to_i) }
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
