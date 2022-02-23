# frozen_string_literal: true

require("config")
require("leetcode/lc_797")

module LeetCode
  class TestLC797 < Minitest::Test
    include(LC797)

    [
      [[[1, 2], [3], [3], []], [[0, 1, 3], [0, 2, 3]]],
      [[[4, 3, 1], [3, 2, 4], [3], [4], []], [[0, 4], [0, 3, 4], [0, 1, 3, 4], [0, 1, 2, 3, 4], [0, 1, 4]]]
    ].each.with_index { |(graph, expected), i|
      define_method(:"test_all_paths_source_target_#{i}") {
        assert_equal(expected, all_paths_source_target(graph))
      }
    }
  end
end
