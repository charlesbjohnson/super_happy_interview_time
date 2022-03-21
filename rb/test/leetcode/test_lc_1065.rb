# frozen_string_literal: true

require("config")
require("leetcode/lc_1065")

module LeetCode
  class TestLC1065 < Minitest::Test
    include(LC1065)

    [
      [["a", ["b"]], []],
      [["a", ["a"]], [[0, 0]]],
      [["thestoryofleetcodeandme", ["story", "fleet", "leetcode"]], [[3, 7], [9, 13], [10, 17]]],
      [["ababa", ["aba", "ab"]], [[0, 1], [0, 2], [2, 3], [2, 4]]]
    ].each.with_index { |((text, words), expected), i|
      define_method(:"test_index_pairs_#{i}") {
        assert_equal(expected, index_pairs(text, words))
      }
    }
  end
end
