# frozen_string_literal: true

require 'config'
require 'leetcode/lc_79'

module LeetCode
  class TestLC79 < Minitest::Test
    include LC79

    [
      [[%w[A]], '', true],
      [[], 'A', false],
      [[[]], 'A', false],
      [[%w[A]], 'A', true],
      [[%w[B]], 'A', false],
      [
        [
          %w[A B],
          %w[D C]
        ],
        'ABCD',
        true
      ],
      [
        [
          %w[A B],
          %w[D C]
        ],
        'ABDC',
        false
      ],
      [
        [
          %w[A B],
          %w[D C]
        ],
        'ABCDA',
        false
      ],
      [
        [
          %w[A B C E],
          %w[S F C S],
          %w[A D E E]
        ],
        'ABCCED',
        true
      ],
      [
        [
          %w[A B C E],
          %w[S F C S],
          %w[A D E E]
        ],
        'SEE',
        true
      ],
      [
        [
          %w[A B C E],
          %w[S F C S],
          %w[A D E E]
        ],
        'ABCB',
        false
      ]
    ].each.with_index do |(board, word, expected), i|
      define_method(:"test_word_exists?_#{i}") do
        assert_equal(expected, word_exists?(board, word))
      end
    end
  end
end
