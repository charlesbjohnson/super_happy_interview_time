# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_114"
module LeetCode
  class TestLC114 < Minitest::Test
    include LC114

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

    def check(expected, tree)
      (0...expected.length).each do |i|
        refute_nil(tree)
        assert_equal(expected[i], tree.val)
        assert_nil(tree.left)

        tree = tree.right
      end
    end

    [
      [[1, 2], [1, 2]],
      [[1, nil, 2], [1, 2]],
      [[1, 2, 3], [1, 2, 3]],
      [[1, 2, nil, 3, 4], [1, 2, 3, 4]],
      [[1, nil, 2, nil, nil, 4, 5], [1, 2, 4, 5]],
      [[1, 2, 3, 4, 5, 6, 7], [1, 2, 4, 5, 3, 6, 7]]
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_flatten_#{i}") do
        check(expected, flatten(build(tree)))
      end
    end
  end
end
