# frozen_string_literal: true

require("config")
require("leetcode/lc_567")

module LeetCode
  class TestLC567 < Minitest::Test
    include(LC567)

    [
      [["ab", "eidbaooo"], true],
      [["ab", "eidboaoo"], false]
    ].each.with_index { |((s1, s2), expected), i|
      define_method(:"test_check_inclusion_#{i}") {
        assert_equal(expected, check_inclusion(s1, s2))
      }
    }
  end
end
