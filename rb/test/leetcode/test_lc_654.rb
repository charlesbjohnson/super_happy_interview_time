# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_654")

module LeetCode
  class Test654 < Minitest::Test
    include(LC654)

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
      [
        [3, 2, 1, 6, 0, 5],
        [6, 3, 5, nil, 2, 0, nil, nil, nil, nil, 1]
      ]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_construct_maximum_binary_tree_#{i}") {
        assert_equal(build(expected), construct_maximum_binary_tree(list))
      }
    }
  end
end
