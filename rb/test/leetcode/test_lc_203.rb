# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_203")

module LeetCode
  class TestLC203 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC203)

    [
      [[], 1, []],
      [[1], 1, []],
      [[1, 2, 3], 1, [2, 3]],
      [[1, 2, 3], 2, [1, 3]],
      [[1, 2, 3], 3, [1, 2]],
      [[1, 2, 6, 3, 4, 5, 6], 6, [1, 2, 3, 4, 5]],
      [[7, 7, 7, 7], 7, []]
    ].each.with_index { |(head, val, expected), i|
      define_method(:"test_remove_elements_#{i}") {
        head = build_linked_list(head)
        expected = build_linked_list(expected)

        if expected
          assert_equal(expected, remove_elements(head, val))
        else
          assert_nil(remove_elements(head, val))
        end
      }
    }
  end
end
