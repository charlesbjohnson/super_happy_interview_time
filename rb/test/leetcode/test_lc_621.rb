# frozen_string_literal: true

require 'config'
require 'leetcode/lc_621'

module LeetCode
  class TestLC621 < Minitest::Test
    include LC621

    [
      [%w[A], 0, 1],
      [%w[A A], 0, 2],
      [%w[A A], 1, 3],
      [%w[A B], 1, 2],
      [%w[A B C], 1, 3],
      [%w[A B A], 1, 3],
      [%w[A B A], 2, 4],
      [%w[A A A B B B], 2, 8],
      [%w[A B A B A B], 2, 8],
      [%w[A A B B C C], 2, 6],
      [%w[A A B B B C], 2, 7],
      [%w[A A A B C D E], 2, 7]
    ].each.with_index do |(tasks, n, expected), i|
      define_method(:"test_least_interval_#{i}") do
        assert_equal(expected, least_interval(tasks, n))
      end
    end
  end
end
