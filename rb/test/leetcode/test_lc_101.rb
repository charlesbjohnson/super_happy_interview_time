# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_101'

module LeetCode
  class TestLC101 < Minitest::Test
    include LC101

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
      [[], true],
      [[0], true],
      [[0, 1, 1], true],
      [[0, 1, 2], false],
      [[0, 1], false],
      [[0, nil, 2], false],
      [[0, 1, 1, 2, 3, 3, 2], true],
      [[0, 1, 1, 2, 3, 2, 3], false],
      [[0, 1, 1, 2, nil, nil, 2], true],
      [[0, 1, 1, 2, nil, 2, nil], false]
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_symmetric?_#{i}") do
        assert_equal(expected, symmetric?(build(tree)))
      end
    end
  end
end
