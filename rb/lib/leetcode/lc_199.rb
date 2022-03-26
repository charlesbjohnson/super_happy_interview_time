# frozen_string_literal: true

module LeetCode
  # 199. Binary Tree Right Side View
  module LC199
    # Description:
    # Given the root of a binary tree, imagine yourself standing on the right side of it,
    # return the values of the nodes you can see ordered from top to bottom.
    #
    # Examples:
    # Input: root = [1, 2, 3, null, 5, null, 4]
    # Output: [1, 3, 4]
    #
    # Input: root = [1, null, 3]
    # Output: [1, 3]
    #
    # Input: root = []
    # Output: []
    #
    # @param {TreeNode} root
    # @return {Array<Integer>}
    def right_side_view(root)
      result = private_methods.grep(/^right_side_view_\d+$/).map { |m| send(m, root) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def right_side_view_1(root)
      result = []

      p_level = [root].compact
      n_level = []

      until p_level.empty?
        result.push(p_level[-1].val)

        p_level.each { |node|
          n_level.push(node.left) if node.left
          n_level.push(node.right) if node.right
        }

        p_level = n_level
        n_level = []
      end

      result
    end

    def right_side_view_2(root)
      result = []
      queue = [root].compact

      until queue.empty?
        result.push(queue[-1].val)

        queue.length.times {
          node = queue.shift
          queue.push(node.left) if node.left
          queue.push(node.right) if node.right
        }
      end

      result
    end
  end
end
