# frozen_string_literal: true

module LeetCode
  # 173. Binary Search Tree Iterator
  module LC173
    # Description:
    # Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):
    # - BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
    # - boolean hasNext()          Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
    # - int next()                 Moves the pointer to the right, then returns the number at the pointer.
    #
    # Notice that by initializing the pointer to a non-existent smallest number, the first call to next() will return the smallest element in the BST.
    # You may assume that next() calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.
    #
    # Examples:
    # Input:
    # ["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
    # [[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
    # Output:
    # [null, 3, 7, true, 9, true, 15, true, 20, false]
    #
    class BSTIterator
      # @param {TreeNode} root
      def initialize(root)
        self.stack = []
        traverse(root)
      end

      # @return {Boolean}
      def next
        node = stack.pop
        traverse(node.right) if node.right
        node.val
      end

      # @return {Boolean}
      def has_next
        !stack.empty?
      end

      private

      attr_accessor(:stack)

      def traverse(root)
        while root
          stack.push(root)
          root = root.left
        end
      end
    end
  end
end
