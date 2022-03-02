# frozen_string_literal: true

require("config")
require("leetcode/lc_91")

module LeetCode
  class TestLC91 < Minitest::Test
    include(LC91)

    [
      ["06", 0],
      ["60", 0],
      ["12", 2],
      ["120", 1],
      ["226", 3]
    ].each.with_index { |(s, expected), i|
      define_method(:"test_num_decodings_#{i}") {
        assert_equal(expected, num_decodings(s))
      }
    }
  end
end
