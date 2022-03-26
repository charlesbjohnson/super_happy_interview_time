# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_451")

module LeetCode
  class TestLC451 < Minitest::Test
    include(LC451)

    [
      ["tree", ["eert", "eetr"]],
      ["cccaaa", ["aaaccc", "cccaaa"]],
      ["Aabb", ["bbAa"]]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_frequency_sort_#{i}") {
        assert_includes(expected, frequency_sort(s))
      }
    }
  end
end
