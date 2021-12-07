# frozen_string_literal: true

require("config")
require("leetcode/lc_104")

module LeetCode
  class TestLC104 < Minitest::Test
    include(LC104)

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
      [[0], 1],
      [[0, 1, 1], 2],
      [[0, 1, nil], 2],
      [[0, nil, 1], 2],
      [[0, 1, nil, 2, nil, nil, nil, 3, nil], 4],
      [[3, 9, 20, nil, nil, 15, 7], 3]
    ].each.with_index { |(tree, expected), i|
      define_method(:"test_max_depth_#{i}") {
        assert_equal(expected, max_depth(build(tree)))
      }
    }
  end
end
