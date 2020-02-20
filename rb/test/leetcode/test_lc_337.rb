# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_337'

module LeetCode
  class TestLC337 < Minitest::Test
    include LC337

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
      [[], 0],
      [[1], 1],
      [[1, 2], 2],
      [[2, 1], 2],
      [[1, 2, 2], 4],
      [[5, 2, 2], 5],
      [[3, 2, 3, nil, 3, nil, 1], 7],
      [[3, 4, 5, 1, 3, nil, 1], 9]
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_rob_#{i}") do
        assert_equal(expected, rob(build(tree)))
      end
    end
  end
end
