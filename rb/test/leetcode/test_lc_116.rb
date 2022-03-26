# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_116")

module LeetCode
  class TestLC116 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC116)

    class Node < Helpers::LeetCode::BinaryTree::TreeNode
      attr_accessor(:next)

      # @param {Object} other
      # @return {Boolean}
      def ==(other)
        super && self.next == other.next
      end

      # @param {Object} other
      # @return {Boolean}
      alias_method(:eql?, :==)
    end

    [
      [],
      [1],
      [1, 2],
      [1, 2, 3],
      [1, 2, 3, 4, 5, 6, 7],
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
      [3, 9, 20, nil, nil, 15, 7]
    ].each.with_index { |root, i|
      define_method(:"test_connect_#{i}") {
        root = build_binary_tree(root, klass: Node)

        if !root
          assert_nil(connect(root))
        else
          levels_binary_tree(connect(root)).each { |level|
            (0...level.length).each { |i|
              if i < level.length - 1
                assert_equal(level[i].next, level[i + 1])
              else
                assert_nil(level[i].next)
              end
            }
          }
        end
      }
    }
  end
end
