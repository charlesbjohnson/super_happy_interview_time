# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_572"

module LeetCode
  class TestLC572 < Minitest::Test
    include LC572

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
      [[], [], true],
      [[0], [], false],
      [[], [0], false],
      [[0], [0], true],
      [[0, 1, 2], [0, 1, nil], false],
      [[0, 1, 2], [0, nil, 2], false],
      [[0, 1, 2], [0, 1, 2], true],
      [[0, 1, 2, 3, 4], [1, 3, 4], true],
      [[0, 1, 2, 3, 4, 5, 6], [1, 3, 4], true],
      [[0, 1, 2, 3, 4, 5, 6], [2, 5, 6], true],
      [[0, 1, 2, 3, 4, 5, 6], [0, 3, 4], false],
      [[0, 1, 2, 3], [0, 1, 2], false],
      [[3, 4, 5, 1, nil, 2], [3, 1, 2], false],
    ].each.with_index do |(left, right, expected), i|
      define_method(:"test_subtree?_#{i}") do
        assert_equal(expected, subtree?(build(left), build(right)))
      end
    end
  end
end
