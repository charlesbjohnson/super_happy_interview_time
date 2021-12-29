# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_234")

module LeetCode
  class TestLC234 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC234)

    [
      [[], true],
      [[1], true],
      [[1, 1], true],
      [[1, 2], false],
      [[1, 2, 1], true],
      [[1, 2, 3], false],
      [[1, 2, 2, 1], true],
      [[1, 2, 3, 2, 1], true]
    ].each.with_index { |(head, expected), i|
      define_method(:"test_is_palindrome_#{i}") {
        assert_equal(expected, is_palindrome(build_linked_list(head)))
      }
    }
  end
end
