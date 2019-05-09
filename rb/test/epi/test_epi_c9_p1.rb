# frozen_string_literal: true

require 'config'
require 'epi/epi_c9_p1'

module EPI
  module C9
    class TestP1 < Minitest::Test
      include P1

      def test_min_max_stack_returns_min_max_stack
        assert_instance_of(DataStructures::MinMaxStack, min_max_stack)
      end
    end
  end
end
