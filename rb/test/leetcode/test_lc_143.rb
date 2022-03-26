# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_143")

module LeetCode
  class TestLC143 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC143)

    [
      [[1], [1]],
      [[1, 2], [1, 2]],
      [[1, 2, 3, 4], [1, 4, 2, 3]],
      [[1, 2, 3, 4, 5], [1, 5, 2, 4, 3]]
    ].each.with_index { |(head, expected), i|
      define_method(:"test_reorder_list_#{i}") {
        head = build_linked_list(head)
        expected = build_linked_list(expected)

        reorder_list(head)

        assert_equal(expected, head)
      }
    }
  end
end
