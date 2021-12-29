# frozen_string_literal: true

require("config")
require("leetcode/lc_6")

module LeetCode
  class TestLC6 < Minitest::Test
    include(LC6)

    [
      ["", 0, ""],
      ["A", 1, "A"],
      ["PAYPALISHIRING", 3, "PAHNAPLSIIGYIR"],
      ["PAYPALISHIRING", 4, "PINALSIGYAHRPI"],
      ["PAYPALISHIRING", 5, "PHASIYIRPLIGAN"]
    ].each.with_index { |(s, num_rows, expected), i|
      define_method(:"test_convert_#{i}") {
        assert_equal(expected, convert(s, num_rows))
      }
    }
  end
end
