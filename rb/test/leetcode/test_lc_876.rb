# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_876")

module LeetCode
  class TestLC876 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC876)

    [
      [1],
      [1, 2],
      [1, 2, 3],
      [1, 2, 3, 4, 5],
      [1, 2, 3, 4, 5, 6]
    ].each.with_index { |head, i|
      define_method(:"test_middle_node_#{i}") {
        expected = head.length / 2

        head = build_linked_list(head)
        expected = index_linked_list(head, expected)

        assert_equal(expected, middle_node(head))
      }
    }
  end
end
