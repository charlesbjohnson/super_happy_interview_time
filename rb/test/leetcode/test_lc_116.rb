# frozen_string_literal: true

require("config")
require("leetcode/lc_116")

module LeetCode
  class TestLC116 < Minitest::Test
    include(LC116)

    def test_connect_nil
      assert_nil(nil)
    end

    def test_connect_single
      tree = TreeLinkNode.new(0)
      connect(tree)
      assert_nil(tree.next)
    end

    def test_connect_height_two
      tree = TreeLinkNode.new(
        0,
        TreeLinkNode.new(1),
        TreeLinkNode.new(2)
      )

      connect(tree)

      assert_nil(tree.next)
      assert_nil(tree.right.next)

      assert_equal(tree.right, tree.left.next)
    end

    def test_connect_height_three
      tree = TreeLinkNode.new(
        0,
        TreeLinkNode.new(
          1,
          TreeLinkNode.new(3),
          TreeLinkNode.new(4)
        ),
        TreeLinkNode.new(
          2,
          TreeLinkNode.new(5),
          TreeLinkNode.new(6)
        )
      )

      connect(tree)

      assert_nil(tree.next)
      assert_nil(tree.right.next)
      assert_nil(tree.right.right.next)

      assert_equal(tree.right, tree.left.next)
      assert_equal(tree.left.right, tree.left.left.next)
      assert_equal(tree.right.left, tree.left.right.next)
      assert_equal(tree.right.right, tree.right.left.next)
    end
  end
end
