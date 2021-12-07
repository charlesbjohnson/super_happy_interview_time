# frozen_string_literal: true

require("config")
require("leetcode/lc_230")

module LeetCode
  class TestLC230 < Minitest::Test
    include(LC230)

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

    def test_kth_smallest_nil
      assert_nil(kth_smallest(nil, 0))
    end

    def test_kth_smallest_zero
      assert_nil(kth_smallest(build([0]), 0))
    end

    [
      [[0], 1, 0],
      [[1, 0], 1, 0],
      [[1, 0], 2, 1],
      [[1, nil, 2], 1, 1],
      [[1, nil, 2], 2, 2],
      [[1, 0, 2], 1, 0],
      [[1, 0, 2], 2, 1],
      [[1, 0, 2], 3, 2],
      [[3, 1, 5, 0, 2, 4, 6], 1, 0],
      [[3, 1, 5, 0, 2, 4, 6], 2, 1],
      [[3, 1, 5, 0, 2, 4, 6], 3, 2],
      [[3, 1, 5, 0, 2, 4, 6], 4, 3],
      [[3, 1, 5, 0, 2, 4, 6], 5, 4],
      [[3, 1, 5, 0, 2, 4, 6], 6, 5],
      [[3, 1, 5, 0, 2, 4, 6], 7, 6]
    ].each.with_index { |(tree, k, expected), i|
      define_method(:"test_kth_smallest_#{i}") {
        assert_equal(expected, kth_smallest(build(tree), k))
      }
    }
  end
end
