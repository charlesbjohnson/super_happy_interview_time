# frozen_string_literal: true

require("config")
require("leetcode/lc_1059")

module LeetCode
  class TestLC1059 < Minitest::Test
    include(LC1059)

    [
      [[3, [[0, 1], [0, 2]], 0, 2], false],
      [[4, [[0, 1], [0, 3], [1, 2], [2, 1]], 0, 3], false],
      [[4, [[0, 1], [0, 2], [1, 3], [2, 3]], 0, 3], true]
    ].each.with_index { |((n, edges, source, destination), expected), i|
      define_method(:"test_leads_to_destination_#{i}") {
        assert_equal(expected, leads_to_destination(n, edges, source, destination))
      }
    }
  end
end
