# frozen_string_literal: true

require("config")
require("leetcode/lc_380")

module LeetCode
  class TestLC380 < Minitest::Test
    include(LC380)

    [
      [[[:insert, 1]], [1], []],
      [[[:remove, 1]], [], []],
      [[[:insert, 1], [:insert, 1]], [1], []],
      [[[:insert, 1], [:remove, 1]], [], []],
      [[[:remove, 1], [:remove, 1]], [], []],
      [[[:insert, 1], [:remove, 1], [:insert, 1], [:remove, 1]], [], []],
      [[[:insert, 1], [:insert, 2], [:insert, 3], [:remove, 2]], [1, 3], [2]]
    ].each.with_index { |(steps, included, excluded), i|
      define_method(:"test_randomized_set_insert_remove_#{i}") {
        subject = RandomizedSet.new

        steps.each { |method, val| subject.send(method, val) }

        assert_predicate(included.map { |val| subject.insert(val) }, :none?)
        assert_predicate(excluded.map { |val| subject.remove(val) }, :none?)
      }
    }

    [
      [[[:insert, 1]], 1],
      [[[:insert, 1], [:insert, 2]], 2],
      [[[:insert, 1], [:insert, 2], [:insert, 3]], 3],
      [[[:insert, 1], [:insert, 2], [:remove, 1]], 1]
    ].each.with_index { |(steps, times), i|
      define_method(:"test_randomized_set_get_random_#{i}") {
        subject = RandomizedSet.new

        steps.each { |method, val| subject.send(method, val) }

        assert_predicate(Array.new(times) { subject.insert(subject.get_random) }, :none?)
        assert_predicate(Array.new(times) { subject.remove(subject.get_random) }, :all?)
      }
    }
  end
end
