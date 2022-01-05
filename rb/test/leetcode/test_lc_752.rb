# frozen_string_literal: true

require("config")
require("leetcode/lc_752")

module LeetCode
  class TestLC752 < Minitest::Test
    include(LC752)

    [
      [[["0201", "0101", "0102", "1212", "2002"], "0202"], 6],
      [[["8888"], "0009"], 1],
      [[["8887", "8889", "8878", "8898", "8788", "8988", "7888", "9888"], "8888"], -1]
    ].each.with_index { |((deadends, target), expected), i|
      define_method(:"test_open_lock_#{i}") {
        assert_equal(expected, open_lock(deadends, target))
      }
    }
  end
end
