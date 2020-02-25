# typed: true
# frozen_string_literal: true

require "config"
require "leetcode/lc_384"

module LeetCode
  class TestLC384 < Minitest::Test
    include LC384

    def test_solution
      list = [-1, 3, 0, 2, 1]

      solution = Solution.new(list.clone)
      shuffled = solution.shuffle
      refute_equal(shuffled, list)

      reset = solution.reset
      assert_equal(reset, list)
    end
  end
end
