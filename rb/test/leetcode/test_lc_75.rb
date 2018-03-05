# frozen_string_literal: true

require 'config'
require 'leetcode/lc_75'

module LeetCode
  class TestLC75 < Minitest::Test
    include LC75

    [
      [0, 0, 0],
      [1, 0, 0],
      [0, 1, 0],
      [0, 0, 1],
      [1, 1, 0],
      [1, 0, 1],
      [0, 1, 1],
      [5, 2, 9]
    ].each.with_index do |(reds, whites, blues), i|
      define_method(:"test_sort_colors_#{i}") do
        list = Array.new(reds) { 0 } + Array.new(whites) { 1 } + Array.new(blues) { 2 }
        assert_equal(list, sort_colors(list.shuffle))
      end
    end
  end
end
