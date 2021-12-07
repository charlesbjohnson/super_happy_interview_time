# frozen_string_literal: true

require("config")
require("leetcode/lc_13")

module LeetCode
  class TestLC13 < Minitest::Test
    include(LC13)

    [
      ["I", 1],
      ["III", 3],
      ["IV", 4],
      ["V", 5],
      ["VIII", 8],
      ["IX", 9],
      ["X", 10],
      ["XIII", 13],
      ["XIV", 14],
      ["XV", 15],
      ["XVIII", 18],
      ["XIX", 19],
      ["MDCCCLXXXIV", 1884],
      ["MMMCMXCIX", 3999]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_roman_to_int_#{i}") {
        assert_equal(expected, roman_to_int(s))
      }
    }
  end
end
