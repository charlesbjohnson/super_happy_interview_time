# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_21")

module LeetCode
  class TestLC21 < Minitest::Test
    include(LC21)

    def build(list)
      return if list.empty?

      head = ListNode.new(list[0])

      list.drop(1).reduce(head) { |res, v|
        res.next = ListNode.new(v)
        res.next
      }

      head
    end

    def test_merge_two_lists_nil
      assert_nil(merge_two_lists(nil, nil))
    end

    [
      [[], [0], [0]],
      [[0], [], [0]],
      [[1], [1], [1, 1]],
      [[2], [1], [1, 2]],
      [[1], [1, 1], [1, 1, 1]],
      [[1, 1], [1], [1, 1, 1]],
      [[1], [0, 2], [0, 1, 2]],
      [[0, 2], [1], [0, 1, 2]],
      [[0, 2], [1, 3], [0, 1, 2, 3]],
      [[1, 2, 4], [1, 3, 4], [1, 1, 2, 3, 4, 4]]
    ].each.with_index { |(left, right, expected), i|
      define_method(:"test_merge_two_lists_#{i}") {
        assert_equal(build(expected), merge_two_lists(build(left), build(right)))
      }
    }
  end
end
