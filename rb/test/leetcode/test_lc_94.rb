# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_94"

module LeetCode
  class TestLC94 < Minitest::Test
    include LC94

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

    [
      [[], []],
      [[1], [1]],
      [[2, nil, 3], [2, 3]],
      [[2, 1, nil], [1, 2]],
      [[2, 1, 3], [1, 2, 3]],
      [[1, nil, 2, nil, nil, 3, nil], [1, 3, 2]],
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_inorder_traversal_#{i}") do
        assert_equal(expected, inorder_traversal(build(tree)))
      end
    end
  end
end
