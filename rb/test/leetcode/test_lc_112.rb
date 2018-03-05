# frozen_string_literal: true

require 'config'
require 'leetcode/lc_112'

module LeetCode
  class TestLC112 < Minitest::Test
    include LC112

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
      [[], 0, false],
      [[0], 0, true],
      [[0], 1, false],
      [[0, nil, 2], 2, true],
      [[0, 1, nil], 1, true],
      [[0, 1, 2, nil, nil, 2, nil], 4, true],
      [[0, 1, 2, nil, nil, 2, nil], 5, false],
      [[0, 1, 2, 3], 4, true],
      [[0, 1, 2, 3], 3, false],
      [[0, 1, 2, 3, 4, 5, 6], 5, true],
      [[0, 1, 2, 3, 4, 5, 6], 1, false],
      [[0, 1, 2, 3, 4, 5, 6], 10, false],
      [[5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1], 22, true],
      [[0, 10, 1, 10, 10], 1, true],
      [[0, 10, 2, -9, 10], 1, true]
    ].each.with_index do |(tree, sum, expected), i|
      define_method(:"test_path_sum?_#{i}") do
        assert_equal(expected, path_sum?(build(tree), sum))
      end
    end
  end
end
