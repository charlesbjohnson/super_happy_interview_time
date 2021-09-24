# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_791")

module LeetCode
  class TestLC791 < Minitest::Test
    include(LC791)

    [
      %w[cba abcd cbad],
      %w[poi aosidbp poiasdb]
    ].each.with_index { |(s, t, expected), i|
      define_method(:"test_custom_sort_string_#{i}") {
        assert_equal(expected, custom_sort_string(s, t))
      }
    }
  end
end
