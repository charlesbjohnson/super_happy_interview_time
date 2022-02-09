# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_173")

module LeetCode
  class TestLC173 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC173)

    [
      [
        [2, 1, 3],
        [
          [:has_next, true],
          [:next, 1],
          [:has_next, true],
          [:next, 2],
          [:has_next, true],
          [:next, 3],
          [:has_next, false]
        ]
      ],

      [
        [7, 3, 15, nil, nil, 9, 20],
        [
          [:next, 3],
          [:next, 7],
          [:has_next, true],
          [:next, 9],
          [:has_next, true],
          [:next, 15],
          [:has_next, true],
          [:next, 20],
          [:has_next, false]
        ]
      ]
    ].each.with_index { |(root, steps), i|
      define_method(:"test_bst_iterator_#{i}") {
        subject = BSTIterator.new(build_binary_tree(root))
        steps.each { |method, expected|
          assert_equal(expected, subject.send(method))
        }
      }
    }
  end
end
