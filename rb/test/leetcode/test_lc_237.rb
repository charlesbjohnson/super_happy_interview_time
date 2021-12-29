# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_237")

module LeetCode
  class TestLC237 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC237)

    [
      [[[1, 2], 0], [2]],
      [[[1, 2, 3], 0], [2, 3]],
      [[[1, 2, 3], 1], [1, 3]],
      [[[1, 2, 3, 4], 2], [1, 2, 4]]
    ].each.with_index { |((head, node), expected), i|
      define_method(:"test_delete_node_#{i}") {
        head = build_linked_list(head)
        node = index_linked_list(head, node)
        expected = build_linked_list(expected)
        delete_node(node)
        assert_equal(expected, head)
      }
    }
  end
end
