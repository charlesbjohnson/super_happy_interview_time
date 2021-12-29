# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_160")

module LeetCode
  class TestLC160 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC160)

    [
      [[4, 1], [5, 6, 1], [8, 4, 5]],
      [[1, 9, 1], [3], [2, 4]],
      [[2, 6, 4], [1, 3], []]
    ].each.with_index { |(head_a, head_b, expected), i|
      define_method(:"test_get_intersection_node_cycle_#{i}") {
        len_a = head_a.length
        len_b = head_b.length

        head_a = build_linked_list(head_a)
        head_b = build_linked_list(head_b)
        expected = build_linked_list(expected)

        tail_a = index_linked_list(head_a, len_a - 1)
        tail_b = index_linked_list(head_b, len_b - 1)

        tail_a.next = expected
        tail_b.next = expected

        if expected
          assert_equal(expected, get_intersection_node(head_a, head_b))
        else
          assert_nil(get_intersection_node(head_a, head_b))
        end
      }
    }
  end
end
