# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_117")

module LeetCode
  class TestLC117 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC117)

    Node = Struct.new(*Helpers::LeetCode::BinaryTree::TreeNode.members, :next)

    [
      [],
      [1],
      [1, 2],
      [1, 2, 3],
      [1, 2, 3, 4, 5, nil, 6],
      [1, 2, 3, 4, 5, nil, 6, nil, 7],
      [1, 2, 3, 4, 5, nil, 6, nil, 7, nil, nil, 8]
    ].each.with_index { |root, i|
      define_method(:"test_connect_#{i}") {
        if root.empty?
          assert_nil(connect(build_binary_tree(root, klass: Node)))
          next
        end

        root = connect(build_binary_tree(root, klass: Node))

        levels_binary_tree(root).each { |level|
          (0...level.length).each { |i|
            if i < level.length - 1
              assert_equal(level[i].next, level[i + 1])
            else
              assert_nil(level[i].next)
            end
          }
        }
      }
    }
  end
end
