# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_102"

module LeetCode
  class TestLC102 < Minitest::Test
    include LC102

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
      [[0, 1, 1, 2, 3, 4, 5], [[0], [1, 1], [2, 3, 4, 5]]],
      [[3, 9, 20, nil, nil, 15, 7], [[3], [9, 20], [15, 7]]],
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_level_order_#{i}") do
        assert_equal(expected, level_order(build(tree)))
      end
    end
  end
end
