# typed: true
# frozen_string_literal: true

require "config"
require "leetcode/lc_160"

module LeetCode
  class TestLC160 < Minitest::Test
    include LC160

    def build(list)
      return if list.empty?

      head = ListNode.new(list[0])

      list.drop(1).reduce(head) do |res, v|
        res.next = ListNode.new(v)
        res.next
      end

      head
    end

    def index(list, i)
      cursor = list

      while i.positive?
        cursor = cursor.next
        i -= 1
      end

      cursor
    end

    def test_intersection_node_nil
      left = nil
      right = build([1, 2, 3])

      assert_nil(intersection_node(left, right))
      assert_nil(intersection_node(right, left))
    end

    def test_intersection_node_no_intersection
      left = build([1, 2, 3])
      right = build([4, 5, 6])

      assert_nil(intersection_node(left, right))
    end

    def test_intersection_node_fork_intersection_same_length
      left = build([1, 2, 3])
      right = build([4, 5, 6])
      overlap = build([7, 8, 9])

      index(left, 2).next = overlap
      index(right, 2).next = overlap

      assert_equal(overlap, intersection_node(left, right))
      assert_equal(overlap, intersection_node(right, left))
    end

    def test_intersection_node_fork_intersection_different_length
      left = build([1, 2, 3])
      right = build([4, 5])
      overlap = build([7, 8, 9])

      index(left, 2).next = overlap
      index(right, 1).next = overlap

      assert_equal(overlap, intersection_node(left, right))
      assert_equal(overlap, intersection_node(right, left))
    end

    def test_intersection_node_full_end_intersection
      left = build([1, 2, 3, 4, 5])
      right = index(left, 2)

      assert_equal(right, intersection_node(left, right))
      assert_equal(right, intersection_node(right, left))
    end
  end
end
