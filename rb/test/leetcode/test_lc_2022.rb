# frozen_string_literal: true

require("config")
require("leetcode/lc_2022")

module LeetCode
  class TestLC2022 < Minitest::Test
    include(LC2022)

    [
      [[[1, 2, 3, 4], 2, 2], [[1, 2], [3, 4]]],
      [[[1, 2, 3], 1, 3], [[1, 2, 3]]],
      [[[1, 2], 1, 1], []]
    ].each.with_index { |((original, m, n), expected), i|
      define_method(:"test_construct2_d_array_#{i}") {
        assert_equal(expected, construct2_d_array(original, m, n))
      }
    }
  end
end
