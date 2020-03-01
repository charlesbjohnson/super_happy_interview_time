# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_297"

module LeetCode
  class TestLC297 < Minitest::Test
    include LC297

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
      [[1, 2, 3], "1,2,3"],
      [[1, 2], "1,2"],
      [[1, nil, 3], "1,,3"],
      [[1, nil, 3, nil, nil, nil, 4], "1,,3,,4"],
      [[1, 2, 3, nil, nil, 4, 5], "1,2,3,,,4,5"]
    ].each.with_index do |(tree, expected), i|
      define_method(:"test_serialize_deserialize_#{i}") do
        assert_equal(expected, serialize(build(tree)))
        assert_equal(build(tree), deserialize(expected))
      end
    end
  end
end
