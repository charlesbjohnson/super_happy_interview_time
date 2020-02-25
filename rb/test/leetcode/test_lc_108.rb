# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_108"

module LeetCode
  class TestLC108 < Minitest::Test
    include LC108

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

    def test_sorted_array_to_bst_nil
      assert_nil(sorted_array_to_bst([]))
    end

    [
      [[0], [0]],
      [[0, 1], [1, 0]],
      [[0, 1, 2], [1, 0, 2]],
      [[-10, -3, 0, 5, 9], [0, -3, 9, -10, nil, 5]],
    ].each.with_index do |(list, expected), i|
      define_method(:"test_sorted_array_to_bst_#{i}") do
        assert_equal(build(expected), sorted_array_to_bst(list))
      end
    end
  end
end
