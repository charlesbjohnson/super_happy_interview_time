# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_234")

module LeetCode
  class TestLC234 < Minitest::Test
    include(LC234)

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
      [[], true],
      [[1], true],
      [[1, 1], true],
      [[1, 2], false],
      [[1, 2, 1], true],
      [[1, 2, 3], false],
      [[1, 2, 2, 1], true],
      [[1, 2, 3, 2, 1], true]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_palindrome?_#{i}") do
        assert_equal(expected, palindrome?(build(list)))
      end
    end
  end
end
