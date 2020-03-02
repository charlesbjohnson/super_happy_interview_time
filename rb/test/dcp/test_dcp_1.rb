# typed: false
# frozen_string_literal: true

require "config"
require "dcp/dcp_1"

module DCP
  class TestDCP1 < Minitest::Test
    include DCP1

    [
      [[], 0, false],
      [[0, 1], 0, false],
      [[0, 1], 1, true],
      [[0, 1, 2], 1, true],
      [[0, 1, 2], 3, true],
      [[0, 1, 2], 2, true]
    ].each.with_index do |(list, target, expected), i|
      define_method(:"test_two_sum?_#{i}") do
        assert_equal(expected, two_sum?(list, target))
      end
    end
  end
end
