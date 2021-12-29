# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_61")

module LeetCode
  class TestLC61 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC61)

    [
      [[[], 0], []],
      [[[1], 1], []],
      [[[1, 2], 0], [1, 2]],
      [[[1, 2], 1], [2, 1]],
      [[[1, 2], 2], [1, 2]],
      [[[1, 2], 3], [2, 1]],
      [[[0, 1, 2], 4], [2, 0, 1]],
      [[[1, 2, 3, 4, 5], 2], [4, 5, 1, 2, 3]]
    ].each.with_index { |((head, k), expected), i|
      define_method(:"test_rotate_right_#{i}") {
        head = build_linked_list(head)
        expected = build_linked_list(expected)

        if expected
          assert_equal(expected, rotate_right(head, k))
        else
          assert_nil(rotate_right(head, k))
        end
      }
    }
  end
end
