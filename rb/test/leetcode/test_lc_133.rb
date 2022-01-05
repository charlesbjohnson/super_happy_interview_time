# frozen_string_literal: true

require("config")
require("helpers/leetcode/graph")

require("leetcode/lc_133")

module LeetCode
  class TestLC133 < Minitest::Test
    include(Helpers::LeetCode::Graph)
    include(LC133)

    [
      [],
      [[]],
      [[2, 4], [1, 3], [2, 4], [1, 3]]
    ].each.with_index { |node, i|
      define_method(:"test_clone_graph_#{i}") {
        expected = build_graph(node)

        if expected
          actual = clone_graph(build_graph(node))
          assert_equal(expected, actual)
          refute_same(expected, actual)
        else
          assert_nil(clone_graph(build_graph(node)))
        end
      }
    }
  end
end
