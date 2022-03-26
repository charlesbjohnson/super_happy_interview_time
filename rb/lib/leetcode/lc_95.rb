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
      cache = Array.new(n + 2) { |l|
        Array.new(n + 1) { |r|
          if l > r
            [nil]
          elsif l == r
            [TreeNode.new(l)]
          end
        }
      }

      (n - 1).downto(1) { |l|
        (l + 1..n).each { |r|
          roots = []

          (l..r).each { |i|
            roots_l = cache[l][i - 1]
            roots_r = cache[i + 1][r]

            roots_l.each { |root_l|
              roots_r.each { |root_r|
                roots.push(TreeNode.new(i, root_l, root_r))
              }
            }
          }

          cache[l][r] = roots
        }
      }

      cache[1][n]
    end
  end
end
