# frozen_string_literal: true

require 'config'
require 'leetcode/lc_438'

module LeetCode
  class TestLC438 < Minitest::Test
    include LC438

    [
      ['', '', [0]],
      ['a', '', [0, 1]],
      ['', 'a', []],
      ['ab', 'ab', [0]],
      ['abba', 'ab', [0, 2]],
      ['abab', 'ab', [0, 1, 2]],
      ['cbaebabacd', 'abc', [0, 6]],
      ['baa', 'aa', [1]],
      ['abacbabc', 'abc', [1, 2, 3, 5]]
    ].each.with_index do |(str, substr, expected), i|
      define_method(:"test_find_anagrams_#{i}") do
        assert_equal(expected, find_anagrams(str, substr))
      end
    end
  end
end
