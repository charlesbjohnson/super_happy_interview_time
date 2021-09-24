# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_237")

module LeetCode
  class TestLC237 < Minitest::Test
    include(LC237)

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
      [[1, 2], proc { |list| list }, [2]],
      [[1, 2, 3], proc { |list| list.next }, [1, 3]],
      [[1, 2, 3], proc { |list| list }, [2, 3]],
      [[1, 2, 2], proc { |list| list }, [2, 2]],
      [[1, 2, 3, 4], proc { |list| list.next.next }, [1, 2, 4]]
    ].each.with_index do |(list, pointer, expected), i|
      define_method(:"test_delete_node_#{i}") do
        list = build(list)
        delete_node(pointer.call(list))
        assert_equal(build(expected), list)
      end
    end
  end
end
