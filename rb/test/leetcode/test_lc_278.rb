# frozen_string_literal: true

require 'config'
require 'leetcode/lc_278'

module LeetCode
  class TestLC278 < Minitest::Test
    include LC278

    def bad_version?(version)
      version >= @bad_version
    end

    alias is_bad_version bad_version?

    [
      [1, 1],
      [2, 1],
      [2, 2],
      [3, 1],
      [3, 2],
      [3, 3]
    ].each.with_index do |(versions, expected), i|
      define_method(:"test_first_bad_version_#{i}") do
        @bad_version = expected
        assert_equal(expected, first_bad_version(versions))
      end
    end
  end
end
