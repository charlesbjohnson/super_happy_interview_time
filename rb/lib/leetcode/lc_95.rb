# frozen_string_literal: true

module LeetCode
  # 95. Unique Binary Search Trees II
  module LC95
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # Given an integer n, return all the structurally unique BST's (binary search trees),
    # which has exactly n nodes of unique values from 1 to n.
    #
    # Return the answer in any order.
    #
    # Examples:
    # Input: n = 3
    # Output: [[1, null, 2, null, 3], [1, null, 3, 2], [2, 1, 3], [3, 1, null, null, 2], [3, 2, null, 1]]
    #
    # Input: n = 1
    # Output: [[1]]
    #
    # @param {Integer} n
    # @return {Array<TreeNode>}
    def generate_trees(n)
      r_generate_trees(1, n, {})
    end

    private

    def r_generate_trees(l, r, cache)
      return [nil] if l > r
      return cache[[l, r]] if cache.key?([l, r])

      result = []

      (l..r).each { |i|
        left_roots = r_generate_trees(l, i - 1, cache)
        right_roots = r_generate_trees(i + 1, r, cache)

        left_roots.each { |left_root|
          right_roots.each { |right_root|
            result.push(TreeNode.new(i, left_root, right_root))
          }
        }
      }

      cache[[l, r]] = result
      result
    end
  end
end
