# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_92")

module LeetCode
  class TestLC92 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC92)

    [
      [[[5], 1, 1], [5]],
      [[[3, 5], 1, 2], [5, 3]],
      [[[1, 2, 3, 4, 5], 2, 4], [1, 4, 3, 2, 5]]
    ].each.with_index { |((head, left, right), expected), i|
      define_method(:"test_reverse_between_#{i}") {
        assert_equal(build_linked_list(expected), reverse_between(build_linked_list(head), left, right))
      }
    }
  end
end
