# frozen_string_literal: true

require("config")
require("leetcode/lc_209")

module LeetCode
  class TestLC209 < Minitest::Test
    include(LC209)

    [
      [[1, [1]], 1],
      [[3, [3, 1, 2]], 1],
      [[3, [1, 2, 3]], 1],
      [[7, [2, 3, 1, 2, 4, 3]], 2],
      [[4, [1, 4, 4]], 1],
      [[11, [1, 1, 1, 1, 1, 1, 1, 1]], 0]
    ].each.with_index { |((target, nums), expected), i|
      define_method(:"test_min_sub_array_len_#{i}") {
        assert_equal(expected, min_sub_array_len(target, nums))
      }
    }
  end
end
