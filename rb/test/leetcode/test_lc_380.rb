# typed: false
# frozen_string_literal: true

require("config")
require("leetcode/lc_380")

module LeetCode
  class TestLC380 < Minitest::Test
    include(LC380)

    [
      [[[:insert, 1]], [1], []],
      [[[:insert, 1], [:insert, 1]], [1], []],
      [[[:insert, 1], [:remove, 1]], [], []],
      [[[:insert, 1], [:insert, 2], [:remove, 1]], [2], [1]]
    ].each.with_index do |(methods, included, excluded), i|
      define_method(:"test_insert_remove_#{i}") do
        set = RandomizedSet.new
        methods.each { |method, val| set.send(method, val) }
        included.none? { |val| set.insert(val) }
        excluded.none? { |val| set.remove(val) }
      end
    end

    [
      [[[:insert, 1]], 2],
      [[[:insert, 1], [:insert, 2]], 3],
      [[[:insert, 1], [:insert, 2], [:insert, 3]], 5],
      [[[:insert, 1], [:insert, 2], [:remove, 1]], 2]
    ].each.with_index do |(methods, times), i|
      define_method(:"test_random_#{i}") do
        set = RandomizedSet.new
        methods.each { |method, val| set.send(method, val) }
        times.times { refute(set.insert(set.random)) }
      end
    end
  end
end
