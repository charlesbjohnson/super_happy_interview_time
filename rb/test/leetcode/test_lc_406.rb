# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_406'

module LeetCode
  class TestLC406 < Minitest::Test
    include LC406

    [
      [
        [],
        []
      ],
      [
        [[1, 0]],
        [[1, 0]]
      ],
      [
        [[1, 1], [2, 0]],
        [[2, 0], [1, 1]]
      ],
      [
        [[1, 1], [2, 0], [1, 0]],
        [[1, 0], [1, 1], [2, 0]]
      ],
      [
        [[7, 0], [4, 4], [7, 1], [5, 0], [6, 1], [5, 2]],
        [[5, 0], [7, 0], [5, 2], [6, 1], [4, 4], [7, 1]]
      ]
    ].each.with_index do |(people, expected), i|
      define_method(:"test_reconstruct_queue_#{i}") do
        assert_equal(expected, reconstruct_queue(people))
      end
    end
  end
end
