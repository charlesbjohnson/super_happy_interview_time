# frozen_string_literal: true

require("config")
require("data_structures/binary_tree")

describe(DataStructures::BinaryTree) {
  subject { DataStructures::BinaryTree }

  it { _(subject).must_respond_to(:from) }

  describe("::from") {
    it("creates a binary tree from required specified nodes") {
      nodes = [[1, [2, 3]]]
      tree = subject.from(nodes, 1)

      assert_equal(1, tree.root.key)
      assert_equal(2, tree.root.left.key)
      assert_equal(3, tree.root.right.key)
    }

    it("creates a binary tree to whatever depth specified") {
      nodes = [[1, [2, 3]], [2, [4, 5]], [3, [6, 7]]]
      tree = subject.from(nodes, 1)

      assert_equal(1, tree.root.key)
      assert_equal(2, tree.root.left.key)
      assert_equal(3, tree.root.right.key)
      assert_equal(4, tree.root.left.left.key)
      assert_equal(5, tree.root.left.right.key)
      assert_equal(6, tree.root.right.left.key)
      assert_equal(7, tree.root.right.right.key)
    }

    it("can create a binary tree with no nodes") {
      nodes = []
      tree = subject.from(nodes, 1)

      assert_nil(tree.root)
    }

    it("can create a binary tree with one node") {
      nodes = [1]
      tree = subject.from(nodes, 1)

      assert_equal(1, tree.root.key)
      assert_nil(tree.root.left)
      assert_nil(tree.root.right)
    }

    it("can create an unbalanced binary tree") {
      nodes = [[1, [2, 3]], [2, [5]], [5, [nil, 8]]]
      tree = subject.from(nodes, 1)

      assert_equal(1, tree.root.key)
      assert_equal(2, tree.root.left.key)
      assert_equal(3, tree.root.right.key)
      assert_equal(5, tree.root.left.left.key)
      assert_equal(8, tree.root.left.left.right.key)
      assert_nil(tree.root.left.right)
      assert_nil(tree.root.right.left)
      assert_nil(tree.root.right.right)
      assert_nil(tree.root.left.left.left)
      assert_nil(tree.root.left.left.right.left)
      assert_nil(tree.root.left.left.right.right)
    }
  }
}
