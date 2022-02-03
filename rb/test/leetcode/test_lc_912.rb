# frozen_string_literal: true

require("config")
require("leetcode/lc_912")

module LeetCode
  class TestLC912 < Minitest::Test
    include(LC912)

    [
      [],
      Array.new(2) { Random.random_number(0..100) },
      Array.new(3) { Random.random_number(0..100) },
      Array.new(10) { Random.random_number(0..100) }
    ].each.with_index { |nums, i|
      define_method(:"test_sort_array_#{i}") {
        assert_equal(nums.sort, sort_array(nums))
      }
    }
  end
end
