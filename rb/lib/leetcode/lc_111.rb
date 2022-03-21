# frozen_string_literal: true

module LeetCode
  # 111. Minimum Depth of Binary Tree
  module LC111
    # Description:
    # Given a binary tree, find its minimum depth.
    # The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
    #
    # Note: A leaf is a node with no children.
    #
    # Examples:
    # Input: root = [3, 9, 20, null, null, 15, 7]
    # Output: 2
    #
    # Input: root = [2, null, 3, null, 4, null, 5, null, 6]
    # Output: 5
    #
    # @param {TreeNode} root
    # @return {Integer}
    def min_depth(root)
      result = private_methods.grep(/^min_depth_\d+$/).map { |m| send(m, root) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def min_depth_1(root)
      return 0 if !root

      rec = ->(node, depth, min) {
        return depth if !node.left && !node.right
        return Float::INFINITY if depth >= min

        l = node.left ? rec.call(node.left, depth + 1, min) : Float::INFINITY
        r = node.right ? rec.call(node.right, depth + 1, l) : Float::INFINITY

        [l, r].min
      }

      rec.call(root, 1, Float::INFINITY)
    end

    def min_depth_2(root)
      return 0 if !root

      queue = [[root, 1]]
      result = Float::INFINITY

      until queue.empty?
        node, depth = queue.shift

        break if depth >= result

        if !node.left && !node.right
          result = [result, depth].min
          next
        end

        queue.push([node.left, depth + 1]) if node.left
        queue.push([node.right, depth + 1]) if node.right
      end

      result
    end
  end
end
