# frozen_string_literal: true

require("config")
require("helpers/leetcode/linked_list")

require("leetcode/lc_138")

module LeetCode
  class TestLC138 < Minitest::Test
    include(Helpers::LeetCode::LinkedList)
    include(LC138)

    def build_linked_list_with_random(values)
      head = build_linked_list(values.map(&:first), klass: Node)

      curr = head
      i = 0

      while curr
        curr.random = values[i][1] ? index_linked_list(head, values[i][1]) : nil
        curr = curr.next
        i += 1
      end

      head
    end

    [
      [],
      [[1, 0]],
      [[1, 1], [2, 1]],
      [[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]],
      [[3, nil], [3, 0], [3, nil]]
    ].each.with_index { |head, i|
      define_method(:"test_copy_random_list_#{i}") {
        expected = build_linked_list_with_random(head)
        head = build_linked_list_with_random(head)

        if expected
          assert_equal(expected, copy_random_list(head))
        else
          assert_nil(copy_random_list(head))
        end
      }
    }
  end
end
