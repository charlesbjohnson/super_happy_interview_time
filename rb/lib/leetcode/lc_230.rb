# typed: true
# frozen_string_literal: true

module LeetCode
  # 230. Kth Smallest Element in a BST
  module LC230
    TreeNode = Struct.new(:val, :left, :right)

    def kth_smallest_recurse(tree, k, count)
      unless tree
        count[0] = 0 unless count[0]
        return
      end

      found = kth_smallest_recurse(tree.left, k, count)
      return found if found

      count[0] += 1
      return tree.val if k == count[0]

      found = kth_smallest_recurse(tree.right, k, count)
      return found if found

      nil
    end

    # Description:
    # Given a binary search tree, write a function to find the kth smallest element in it.
    #
    # Notes:
    # - You may assume k is always valid, 1 <= k <= BST's total elements.
    # - What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently?
    #
    # @param tree {TreeNode}
    # @param k {Integer}
    # @return {Integer}
    def kth_smallest(tree, k)
      return unless tree
      return if k < 1

      kth_smallest_recurse(tree, k, [])
    end
  end
end
