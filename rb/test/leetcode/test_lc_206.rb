# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_206")

module LeetCode
  class TestLC206 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC206)

    [
      [[], []],
      [[1], [1]],
      [[1, 2], [2, 1]],
      [[1, 2, 3], [3, 2, 1]]
    ].each.with_index { |(head, expected), i|
      define_method(:"test_reverse_list_#{i}") {
        head = build_linked_list(head)
        expected = build_linked_list(expected)

        if expected
          assert_equal(expected, reverse_list(head))
        else
          assert_nil(reverse_list(head))
        end
      }
    }
  end
end
