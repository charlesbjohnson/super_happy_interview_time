# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_19")

module LeetCode
  class TestLC19 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC19)

    [
      [[1], 1, []],
      [[1, 2], 1, [1]],
      [[1, 2], 2, [2]],
      [[1, 2, 3], 1, [1, 2]],
      [[1, 2, 3], 2, [1, 3]],
      [[1, 2, 3], 3, [2, 3]],
      [[1, 2, 3, 4, 5], 2, [1, 2, 3, 5]]
    ].each.with_index { |(head, n, expected), i|
      define_method(:"test_remove_nth_from_end_#{i}") {
        head = build_linked_list(head)
        expected = build_linked_list(expected)

        if expected
          assert_equal(expected, remove_nth_from_end(head, n))
        else
          assert_nil(remove_nth_from_end(head, n))
        end
      }
    }
  end
end
