# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_538")

module LeetCode
  class TestLC538 < Minitest::Test
    include(LC538)

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

    def test_convert_bst_nil
      assert_nil(convert_bst(nil))
    end

    [
      [[0], [0]],
      [[1, nil, 3], [4, nil, 3]],
      [[1, 2, nil], [1, 3, nil]],
      [[1, 2, 3], [4, 6, 3]],
      [[1, 2, 3, nil, nil, 4, nil], [8, 10, 3, nil, nil, 7, nil]],
      [[1, 2, 3, 4, 5, 6, 7], [17, 24, 10, 28, 22, 16, 7]]
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_convert_bst_#{i}") do
        assert_equal(build(expected), convert_bst(build(tree)))
      end
    end
  end
end
