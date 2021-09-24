# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_543")

module LeetCode
  class TestLC543 < Minitest::Test
    include(LC543)

    def build(values)
      return if values.empty?

      nodes = values.map { |v| v ? TreeNode.new(v) : nil }
      nodes.each.with_index { |node, i|
        next unless node

        left = i * 2 + 1
        right = left + 1

        node.left = nodes[left] if left < nodes.length
        node.right = nodes[right] if right < nodes.length
      }

      nodes.first
    end

    [
      [[], 0],
      [[0], 0],
      [[0, 1, nil], 1],
      [[0, nil, 1], 1],
      [[0, 1, 2], 2],
      [[0, 1, 2, 3, 4, 5, 6], 4],
      [[0, 1, 2, 3, 4, nil, nil], 3]
    ].each.with_index { |(tree, expected), i|
      define_method(:"test_diameter_of_binary_tree_#{i}") {
        assert_equal(expected, diameter_of_binary_tree(build(tree)))
      }
    }
  end
end
