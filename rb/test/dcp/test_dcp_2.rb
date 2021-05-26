# typed: false
# frozen_string_literal: true

require "config"
require "dcp/dcp_2"

module DCP
  class TestDCP2 < Minitest::Test
    include DCP2

    [
      false
    ].each.with_index do |expected, i|
      define_method(:"test_todo_#{i}") do
        assert_equal(expected, todo)
      end
    end
  end
end
