# frozen_string_literal: true

require 'config'
require 'epi/epi_c6_p8'

module EPI
  module C6
    class TestP8 < Minitest::Test
      include P8

      def test_capacity_returns_the_max_difference
        heights = [17, -9, 29, 42, 25, 45, -21, 39, 2, 42, -60]
        result = capacity(heights)
        assert_equal(63, result)
      end

      def test_capacity_returns_zero_when_nothing_to_process
        heights = []
        result = capacity(heights)
        assert_equal(0, result)
      end
    end
  end
end
