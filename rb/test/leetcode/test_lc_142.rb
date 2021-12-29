# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_142")

module LeetCode
  class TestLC142 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC142)

    [
      [[], nil],
      [[1], nil],
      [[1, 2], nil],
      [[1, 2, 3], nil],
      [[1, 2], 0],
      [[3, 2, 0, -4], 1]
    ].each.with_index { |(head, pos), i|
      define_method(:"test_detect_cycle_#{i}") {
        head, expected = build_linked_list_with_cycle(head, pos)
        if expected.nil?
          assert_nil(detect_cycle(head))
        else
          assert_equal(expected, detect_cycle(head))
        end
      }
    }
  end
end
