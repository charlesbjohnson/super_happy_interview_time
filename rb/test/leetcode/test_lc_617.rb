# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_617")

module LeetCode
  class TestLC617 < Minitest::Test
    include(LC617)

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
      [
        [1, 3, 2, 5],
        [2, 1, 3, nil, 4, nil, 7],
        [3, 4, 5, 5, 4, nil, 7]
      ]
    ].each.with_index do |(left, right, expected), i|
      define_method(:"test_merge_trees_#{i}") do
        assert_equal(build(expected), merge_trees(build(left), build(right)))
      end
    end
  end
end
