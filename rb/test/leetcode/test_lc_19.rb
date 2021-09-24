# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_19")

module LeetCode
  class TestLC19 < Minitest::Test
    include(LC19)

    def build(list)
      head = ListNode.new(list[0])

      list.drop(1).reduce(head) do |res, v|
        res.next = ListNode.new(v)
        res.next
      end

      head
    end

    def test_remove_nth_from_end_empty
      assert_nil(remove_nth_from_end(ListNode.new, 1))
    end

    [
      [[8, 9], 1, [8]],
      [[8, 9], 2, [9]],
      [[7, 8, 9], 2, [7, 9]],
      [[1, 2, 3, 4, 5], 2, [1, 2, 3, 5]]
    ].each.with_index do |(list, nth, expected), i|
      define_method(:"test_remove_nth_from_end_#{i}") do
        assert_equal(build(expected), remove_nth_from_end(build(list), nth))
      end
    end
  end
end
