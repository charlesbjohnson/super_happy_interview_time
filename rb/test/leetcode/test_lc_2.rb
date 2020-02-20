# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_2'

module LeetCode
  class TestLC2 < Minitest::Test
    include LC2

    def build(list)
      return if list.empty?

      head = ListNode.new(list[0])

      list.drop(1).reduce(head) do |res, v|
        res.next = ListNode.new(v)
        res.next
      end

      head
    end

    [
      [
        [1],
        [1],
        [2]
      ],
      [
        [1, 2],
        [2],
        [3, 2]
      ],
      [
        [1],
        [1, 2],
        [2, 2]
      ],
      [
        [3],
        [9],
        [2, 1]
      ],
      [
        [3, 9],
        [9],
        [2, 0, 1]
      ],
      [
        [2, 4, 3],
        [5, 6, 4],
        [7, 0, 8]
      ]
    ].each.with_index do |(left, right, expected), i|
      define_method(:"test_add_two_numbers_#{i}") do
        assert_equal(build(expected), add_two_numbers(build(left), build(right)))
      end
    end
  end
end
