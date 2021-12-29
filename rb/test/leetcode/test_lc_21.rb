# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_21")

module LeetCode
  class TestLC21 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC21)

    [
      [[], [], []],
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
    ].each.with_index { |(list1, list2, expected), i|
      define_method(:"test_merge_two_lists_#{i}") {
        list1 = build_linked_list(list1)
        list2 = build_linked_list(list2)
        expected = build_linked_list(expected)

        if expected
          assert_equal(expected, merge_two_lists(list1, list2))
        else
          assert_nil(merge_two_lists(list1, list2))
        end
      }
    }
  end
end
