# typed: true
# frozen_string_literal: true

module CTCI
  module C4
    module P6
      # Write an algorithm to find the 'next' node (i.e, in-order successor)
      # of a given node in a binary search tree. You may assume that each
      # node has a link to its parent.
      def next_inorder(cursor)
        if cursor.right.nil?
          parent = cursor
          parent = parent.parent until parent.nil? || parent.key > cursor.key

          parent
        else
          min(cursor.right)
        end
      end

      private

      def min(cursor)
        return cursor if cursor.left.nil?

        min(cursor.left)
      end
    end
  end
end
