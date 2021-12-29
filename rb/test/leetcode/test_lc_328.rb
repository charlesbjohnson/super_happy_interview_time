# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_328")

module LeetCode
  class TestLC328 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC328)

    [
      [[], []],
      [[1], [1]],
      [[1, 2], [1, 2]],
      [[1, 2, 3], [1, 3, 2]],
      [[1, 2, 3, 4], [1, 3, 2, 4]],
      [[1, 2, 3, 4, 5], [1, 3, 5, 2, 4]]
    ].each.with_index { |(head, expected), i|
      define_method(:"test_odd_even_list_#{i}") {
        head = build_linked_list(head)
        expected = build_linked_list(expected)

        if expected
          assert_equal(expected, odd_even_list(head))
        else
          assert_nil(odd_even_list(head))
        end
      }
    }
  end
end
