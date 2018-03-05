# frozen_string_literal: true

require 'config'
require 'leetcode/lc_141'

module LeetCode
  class TestLC141 < Minitest::Test
    include LC141

    def build(list)
      return if list.empty?

      head = ListNode.new(list[0])

      list.drop(1).reduce(head) do |res, v|
        res.next = ListNode.new(v)
        res.next
      end

      head
    end

    def build_cycle
      head = build([1, 2, 3, 4])
      head.next.next.next.next = head
      head
    end

    [
      [[], false],
      [[1], false],
      [[1, 2], false],
      [[1, 2, 3], false],
      [[1, 2, 3, 4], false]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_cycle?_#{i}") do
        assert_equal(expected, cycle?(build(list)))
      end
    end

    define_method(:"test_cycle?_cycle") do
      assert_equal(true, cycle?(build_cycle))
    end
  end
end
