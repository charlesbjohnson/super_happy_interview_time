# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_238"

module LeetCode
  class TestLC238 < Minitest::Test
    include LC238

    [
      [[1, 2], [2, 1]],
      [[1, 2, 3], [6, 3, 2]],
      [[1, 2, 3, 4], [24, 12, 8, 6]]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_product_except_self_#{i}") do
        assert_equal(expected, product_except_self(list))
      end
    end
  end
end
