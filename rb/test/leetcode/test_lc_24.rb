# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_24")

module LeetCode
  class TestLC24 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC24)

    [
      [[], []],
      [[1], [1]],
      [[1, 2], [2, 1]],
      [[1, 2, 3], [2, 1, 3]],
      [[1, 2, 3, 4], [2, 1, 4, 3]]
    ].each.with_index { |(head, expected), i|
      define_method(:"test_swap_pairs_#{i}") {
        head = build_linked_list(head)
        expected = build_linked_list(expected)

        if expected
          assert_equal(expected, swap_pairs(head))
        else
          assert_nil(swap_pairs(head))
        end
      }
    }
  end
end
