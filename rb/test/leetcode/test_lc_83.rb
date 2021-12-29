# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_83")

module LeetCode
  class TestLC83 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC83)

    [
      [[], []],
      [[1], [1]],
      [[1, 1, 2], [1, 2]],
      [[1, 1, 2, 3, 3], [1, 2, 3]]
    ].each.with_index { |(head, expected), i|
      define_method(:"test_delete_duplicates_#{i}") {
        head = build_linked_list(head)
        expected = build_linked_list(expected)

        if expected
          assert_equal(expected, delete_duplicates(head))
        else
          assert_nil(delete_duplicates(head))
        end
      }
    }
  end
end
