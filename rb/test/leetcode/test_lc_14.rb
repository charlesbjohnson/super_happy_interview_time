# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_14")

module LeetCode
  class TestLC14 < Minitest::Test
    include(LC14)

    [
      [[], ""],
      [[""], ""],
      [["a"], "a"],
      [%w[a b], ""],
      [%w[aa ab], "a"],
      [%w[aaa ab aac], "a"]
    ].each.with_index { |(list, expected), i|
      define_method(:"test_longest_common_prefix_#{i}") {
        assert_equal(expected, longest_common_prefix(list))
      }
    }
  end
end
