# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_105'

module LeetCode
  class TestLC105 < Minitest::Test
    include LC105

    def build(values)
      return if values.empty?

      nodes = values.map { |v| v ? TreeNode.new(v) : nil }
      nodes.each.with_index do |node, i|
        next unless node

        left = i * 2 + 1
        right = left + 1

        node.left = nodes[left] if left < nodes.length
        node.right = nodes[right] if right < nodes.length
      end

      nodes.first
    end

    def test_build_tree_empty
      assert_nil(build_tree([], []))
      assert_nil(build_tree([0], []))
      assert_nil(build_tree([], [0]))
    end

    [
      [
        [0],
        [0],
        [0]
      ],
      [
        [0, 1, 2],
        [1, 0, 2],
        [0, 1, 2]
      ],
      [
        [0, 1, 3, 4, 2, 5, 6],
        [3, 1, 4, 0, 5, 2, 6],
        [0, 1, 2, 3, 4, 5, 6]
      ],
      [
        [0, 1, 4],
        [1, 4, 0],
        [0, 1, nil, nil, 4]
      ],
      [
        [3, 9, 20, 15, 7],
        [9, 3, 15, 20, 7],
        [3, 9, 20, nil, nil, 15, 7]
      ],
      [
        [1, 3, 2, 4],
        [1, 2, 3, 4],
        [1, nil, 3, nil, nil, 2, 4]
      ]
    ].each.with_index do |(preorder, inorder, expected), i|
      define_method(:"test_build_tree_#{i}") do
        assert_equal(build(expected), build_tree(preorder, inorder))
      end
    end
  end
end
