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
        node = build_graph(node)

        if node
          clone = clone_graph(node)
          assert_equal(clone, node)
          refute_same(clone, node)
        else
          assert_nil(clone_graph(node))
        end
      }
    }
  end
end
