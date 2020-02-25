# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_103"

module LeetCode
  class TestLC103 < Minitest::Test
    include LC103

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
      [[0], [[0]]],
      [[0, 1, 1], [[0], [1, 1]]],
      [[0, 1], [[0], [1]]],
      [[0, nil, 1], [[0], [1]]],
      [[0, 1, 2, 3, 4, 5, 6], [[0], [2, 1], [3, 4, 5, 6]]],
      [(0...15).to_a, [[0], [2, 1], [3, 4, 5, 6], [14, 13, 12, 11, 10, 9, 8, 7]]],
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_zigzag_level_order_#{i}") do
        assert_equal(expected, zigzag_level_order(build(tree)))
      end
    end
  end
end
