# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_141")

module LeetCode
  class TestLC141 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC141)

    [
      [[[], nil], false],
      [[[1], nil], false],
      [[[1, 2], nil], false],
      [[[1, 2, 3], nil], false],
      [[[1, 2], 0], true],
      [[[3, 2, 0, -4], 1], true]
    ].each.with_index { |((head, pos), expected), i|
      define_method(:"test_has_cycle_#{i}") {
        assert_equal(expected, has_cycle(build_linked_list_with_cycle(head, pos).first))
      }
    }
  end
end
