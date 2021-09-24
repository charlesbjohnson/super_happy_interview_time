# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_206")

module LeetCode
  class TestLC206 < Minitest::Test
    include(LC206)

    def build(list)
      head = ListNode.new(list[0])

      list.drop(1).reduce(head) { |res, v|
        res.next = ListNode.new(v)
        res.next
      }

      head
    end

    def test_reverse_list_nil
      assert_nil(reverse_list(nil))
    end

    [
      [[1], [1]],
      [[1, 2], [2, 1]],
      [[1, 2, 3], [3, 2, 1]]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_reverse_list_#{i}") {
        assert_equal(build(expected), reverse_list(build(list)))
      }
    }
  end
end
