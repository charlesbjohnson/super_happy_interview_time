# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_98")

module LeetCode
  class TestLC98 < Minitest::Test
    include(LC98)

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
      [[1, 0], true],
      [[1, 2], false],
      [[0, 0, 0], false],
      [[1, 0, 2], true],
      [[1, 2, 0], false],
      [[2, 1, 3], true],
      [[1, 2, 3], false],
      [[4, 2, 6, 1, 3, 5, 7], true],
      [[4, 2, 6, 1, 3, 5, 7, nil, nil, -1], false],
      [[4, 2, 6, 1, 3, 5, 7, nil, nil, nil, 4], false]
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_valid_bst?_#{i}") do
        assert_equal(expected, valid_bst?(build(tree)))
      end
    end
  end
end
