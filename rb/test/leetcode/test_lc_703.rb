# frozen_string_literal: true

require("config")
require("helpers/leetcode/heap")

require("leetcode/lc_703")

module LeetCode
  class TestLC703 < Minitest::Test
    include(LC703)

    [
      [[1, [1, 2]], [[:add, [3], 3]]],
      [[1, [1, 2]], [[:add, [1], 2]]],
      [[1, [1, 2]], [[:add, [2], 2]]],
      [[2, [1, 2]], [[:add, [3], 2]]],
      [[2, [1, 2]], [[:add, [2], 2]]],
      [[2, [1, 2]], [[:add, [1], 1]]],
      [[3, [1, 2]], [[:add, [3], 1]]],
      [[3, [1, 2]], [[:add, [2], 1]]],
      [[3, [1, 2]], [[:add, [1], 1]]],
      [[3, [4, 5, 8, 2]], [[:add, 3, 4], [:add, 5, 5], [:add, 10, 5], [:add, 9, 8], [:add, 4, 8]]]
    ].each.with_index { |((k, nums), steps), i|
      define_method(:"test_kth_largest_#{i}") {
        subject = KthLargest.new(k, nums)
        steps.each { |method, args, expected|
          assert_equal(expected, subject.send(method, *args))
        }
      }
    }
  end
end
