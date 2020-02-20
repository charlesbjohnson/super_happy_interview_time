# typed: false
# frozen_string_literal: true

require 'config'
require 'leetcode/lc_394'

module LeetCode
  class TestLC394 < Minitest::Test
    include LC394

    [
      %w[a a],
      %w[abc abc],
      %w[3[a] aaa],
      %w[abc3[a]def abcaaadef],
      %w[x2[a]y2[b]z xaaybbz],
      %w[2[2[a]1[b]] aabaab],
      %w[3[a]2[bc] aaabcbc],
      %w[3[a2[c]] accaccacc],
      %w[2[abc]3[cd]ef abcabccdcdcdef],
      %w[3[z]2[2[y]pq4[2[jk]e1[f]]]ef zzzyypqjkjkefjkjkefjkjkefjkjkefyypqjkjkefjkjkefjkjkefjkjkefef]
    ].each.with_index do |(str, expected), i|
      define_method(:"test_decode_string_#{i}") do
        assert_equal(expected, decode_string(str))
      end
    end
  end
end
