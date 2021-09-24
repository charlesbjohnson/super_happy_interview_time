# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_162")

module LeetCode
  class TestLC162 < Minitest::Test
    include(LC162)

    def test_find_peak_element_empty
      assert_nil(find_peak_element([]))
    end

    [
      [[0], 0],
      [[2, 1, 0], 0],
      [[0, 1, 0], 1],
      [[0, 1, 2], 2],
      [[1, 2, 3, 1], 2],
      [[1, 0, 1], 0]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_find_peak_element_#{i}") do
        assert_equal(expected, find_peak_element(list))
      end
    end
  end
end
