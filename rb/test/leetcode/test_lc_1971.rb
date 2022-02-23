# frozen_string_literal: true

require("config")
require("leetcode/lc_1971")

module LeetCode
  class TestLC1971 < Minitest::Test
    include(LC1971)

    [
      [[3, [[0, 1], [1, 2], [2, 0]], 0, 2], true],
      [[6, [[0, 1], [0, 2], [3, 5], [5, 4], [4, 3]], 0, 5], false]
    ].each.with_index { |((n, edges, source, destination), expected), i|
      define_method(:"test_valid_path_#{i}") {
        assert_equal(expected, valid_path(n, edges, source, destination))
      }
    }
  end
end
