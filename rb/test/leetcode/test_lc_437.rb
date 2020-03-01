# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_437"

module LeetCode
  class TestLC437 < Minitest::Test
    include LC437

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
      [[], 0, 0],
      [[0], 0, 1],
      [[0, 1, 2], 2, 2],
      [[0, nil, 2], 2, 2],
      [[0, 1, nil], 1, 2],
      [[0, 1, 2, 3, 4, 5, 6], 7, 2],
      [[0, 1, 2, 3, 4, 5, 6], 5, 3],
      [[10, 5, -3, 3, 2, nil, 11, 3, -2, nil, 1], 8, 3],
      [[0, 1, 2, 3], 3, 1]
    ].each.with_index do |(tree, sum, expected), i|
      define_method(:"test_path_sum_#{i}") do
        assert_equal(expected, path_sum(build(tree), sum))
      end
    end
  end
end
