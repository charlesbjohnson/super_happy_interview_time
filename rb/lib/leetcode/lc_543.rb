# frozen_string_literal: true

module LeetCode
  # 543. Diameter of Binary Tree
  module LC543
    # Given the root of a binary tree, return the length of the diameter of the tree.
    #
    # The diameter of a binary tree is the length of the longest path between any two nodes in a tree.
    # This path may or may not pass through the root.
    #
    # The length of a path between two nodes is represented by the number of edges between them.
    #
    # Input: root = [1, 2, 3, 4, 5]
    # Output: 3
    #
    # Input: root = [1, 2]
    # Output: 1
    #
    # @param {TreeNode} root
    # @return {Integer}
    def diameter_of_binary_tree(root)
      result = private_methods.grep(/^diameter_of_binary_tree_\d+$/).map { |m| send(m, root) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def diameter_of_binary_tree_1(root)
      cache = {}

      max_depth = ->(node) {
        cache[node] ||= node ? 1 + [max_depth.call(node.left), max_depth.call(node.right)].max : 0
      }

      rec = ->(node) {
        return 0 if !node

        [
          max_depth.call(node.left) + max_depth.call(node.right),
          rec.call(node.left),
          rec.call(node.right)
        ].max
      }

      rec.call(root)
    end

    def diameter_of_binary_tree_2(root)
      cache = Hash.new(0)
      stack = [[root, false]]

      until stack.empty?
        node, visited = stack.pop

        next if !node

        if visited
          cache[node] = 1 + [cache[node.left], cache[node.right]].max
          next
        end

        if !node.left && !node.right
          cache[node] = 1
          next
        end

        stack.push([node, true])
        stack.push([node.right, false])
        stack.push([node.left, false])
      end

      result = 0
      stack = [root]

      until stack.empty?
        node = stack.pop

        next if !node || (!node.left && !node.right)

        result = [result, cache[node.left] + cache[node.right]].max

        stack.push(node.right)
        stack.push(node.left)
      end

      result
    end
  end
end
