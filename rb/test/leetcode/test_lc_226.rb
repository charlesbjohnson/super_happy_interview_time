# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_226'

module LeetCode
  class TestLC226 < Minitest::Test
    include LC226

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

    def test_invert_tree_nil
      assert_nil(invert_tree(nil))
    end

    [
      [[0], [0]],
      [[0, 1, nil], [0, nil, 1]],
      [[0, nil, 1], [0, 1, nil]],
      [[0, 1, 2, 3, 4, 5, 6], [0, 2, 1, 6, 5, 4, 3]]
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_invert_tree_#{i}") do
        assert_equal(build(expected), invert_tree(build(tree)))
      end
    end
  end
end
