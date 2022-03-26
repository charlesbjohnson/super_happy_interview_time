# frozen_string_literal: true

module LeetCode
  # 863. All Nodes Distance K in Binary Tree
  module LC863
    # Description:
    # Given the root of a binary tree, the value of a target node target, and an integer k,
    # return an array of the values of all nodes that have a distance k from the target node.
    #
    # You can return the answer in any order.
    #
    # Examples:
    # Input: root = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4], target = 5, k = 2
    # Output: [7, 4, 1]
    #
    # Input: root = [1], target = 1, k = 3
    # Output: []
    #
    # @param {TreeNode} root
    # @param {TreeNode} target
    # @param {Integer} k
    # @return {Array<Integer>}
    def distance_k(root, target, k)
      result = []

      graph = Hash.new { |h, k| h[k] = [] }
      stack = [root]

      until stack.empty?
        node = stack.pop

        if node.left
          graph[node.val].push(node.left.val)
          graph[node.left.val].push(node.val)
          stack.push(node.left)
        end

        if node.right
          graph[node.val].push(node.right.val)
          graph[node.right.val].push(node.val)
          stack.push(node.right)
        end
      end

      queue = stack
      queue.push([target.val, 0])

      visited = Set.new

      until queue.empty?
        node, dist = queue.shift

        next if !visited.add?(node)

        case dist <=> k
        when 0
          result.push(node)
          next
        when -1
          graph[node].each { |neighbor|
            queue.push([neighbor, dist + 1])
          }
        end
      end

      result
    end
  end
end
