# frozen_string_literal: true

module Helpers
  module LeetCode
    module BinaryTree
      TreeNode = Struct.new(:val, :left, :right) {
        # @param {TreeNode} original
        def initialize_clone(original)
          super
          self.left = original.left.clone
          self.right = original.right.clone
        end

        # @param {TreeNode} original
        def initialize_dup(original)
          super
          self.left = original.left.dup
          self.right = original.right.dup
        end
      }

      # @param {Array} values
      # @return {TreeNode}
      def build_binary_tree(values, klass: TreeNode)
        nodes = values.map { |v| v ? klass.new(v) : nil }
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

      # @param {TreeNode} root
      # @return {Array<Array<TreeNode>>}
      def levels_binary_tree(root)
        result = []
        stack = []

        stack.push([root]) if root

        until stack.empty?
          nodes = stack.pop

          result.push(nodes)
          nodes = nodes.flat_map { |node| [node.left, node.right].compact }

          stack.push(nodes) unless nodes.empty?
        end

        result
      end
    end
  end
end
