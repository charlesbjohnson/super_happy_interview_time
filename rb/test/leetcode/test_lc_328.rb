# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_328"

module LeetCode
  class TestLC328 < Minitest::Test
    include LC328

    def build(list)
      return if list.empty?

      head = ListNode.new(list[0])

      list.drop(1).reduce(head) do |res, v|
        res.next = ListNode.new(v)
        res.next
      end

      head
    end

    def test_odd_even_list_nil
      assert_nil(odd_even_list(build([])))
    end

    [
      [
        [1],
        [1]
      ],
      [
        [1, 2],
        [1, 2]
      ],
      [
        [1, 2, 3],
        [1, 3, 2]
      ],
      [
        [1, 2, 3, 4],
        [1, 3, 2, 4]
      ],
      [
        [1, 2, 3, 4, 5],
        [1, 3, 5, 2, 4]
      ]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_odd_even_list_#{i}") do
        assert_equal(build(expected), odd_even_list(build(list)))
      end
    end
  end
end
