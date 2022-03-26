# frozen_string_literal: true

module LeetCode
  # 437. Path Sum III
  module LC437
    # Description:
    # Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.
    #
    # The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).
    #
    # Examples:
    # Input: root = [10, 5, -3, 3, 2, null, 11, 3, -2, null, 1], targetSum = 8
    # Output: 3
    #
    # Input: root = [5, 4, 8, 11, null, 13, 4, 7, 2, null, null, 5, 1], targetSum = 22
    # Output: 3
    #
    # @param {TreeNode} root
    # @param {Integer} target_sum
    # @return {Integer}
    def path_sum(root, target_sum)
      result = private_methods.grep(/^path_sum_\d+$/).map { |m| send(m, root, target_sum) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def path_sum_1(root, target_sum)
      result = 0

      rec = ->(node, sum, summing) {
        return if !node

        sum += node.val
        result += 1 if sum == target_sum

        if !summing
          rec.call(node.left, 0, false)
          rec.call(node.right, 0, false)
        end

        rec.call(node.left, sum, true)
        rec.call(node.right, sum, true)
      }

      rec.call(root, 0, false)
      result
    end

    def path_sum_2(root, target_sum)
      result = 0
      hash = Hash.new(0)

      rec = ->(node, sum) {
        return if !node

        sum += node.val
        result += hash[sum - target_sum]

        hash[sum] += 1
        rec.call(node.left, sum)
        rec.call(node.right, sum)
        hash[sum] -= 1
      }

      hash[0] = 1
      rec.call(root, 0)
      result
    end
  end
end
