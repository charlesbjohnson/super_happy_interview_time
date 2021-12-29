# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_2")

module LeetCode
  class TestLC2 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC2)

    [
      [[1], [1], [2]],
      [[1, 2], [2], [3, 2]],
      [[1], [1, 2], [2, 2]],
      [[3], [9], [2, 1]],
      [[3, 9], [9], [2, 0, 1]],
      [[2, 4, 3], [5, 6, 4], [7, 0, 8]]
    ].each.with_index { |(left, right, expected), i|
      define_method(:"test_add_two_numbers_#{i}") {
        assert_equal(build_linked_list(expected), add_two_numbers(build_linked_list(left), build_linked_list(right)))
      }
    }
  end
end
