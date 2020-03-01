# typed: false
# frozen_string_literal: true

require "config"
require "leetcode/lc_49"

module LeetCode
  class TestLC49 < Minitest::Test
    include LC49

    [
      [[], []],
      [
        %w[foo],
        [
          %w[foo]
        ]
      ],
      [
        %w[foo oof],
        [
          %w[foo oof]
        ]
      ],
      [
        %w[foo oof bar],
        [
          %w[foo oof],
          %w[bar]
        ]
      ],
      [
        %w[eat tea tan ate nat bat],
        [
          %w[ate eat tea],
          %w[nat tan],
          %w[bat]
        ]
      ]
    ].each.with_index do |(list, expected), i|
      define_method(:"test_group_anagrams_#{i}") do
        assert_equal(expected.map(&:sort), group_anagrams(list).map(&:sort))
      end
    end
  end
end
