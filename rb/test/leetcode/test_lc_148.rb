# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_148")

module LeetCode
  class TestLC148 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC148)

    [
      [],
      [1],
      [4, 2, 1, 3],
      [-1, 5, 3, 4, 0]
    ].each.with_index { |head, i|
      define_method(:"test_sort_list_#{i}") {
        if !head.empty?
          assert_equal(build_linked_list(head.sort), sort_list(build_linked_list(head)))
        else
          assert_nil(sort_list(build_linked_list(head)))
        end
      }
    }
  end
end
