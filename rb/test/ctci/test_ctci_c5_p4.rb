# typed: true
# frozen_string_literal: true

require 'config'
require 'ctci/ctci_c5_p4'

module CTCI
  module C5
    class TestP4 < Minitest::Test
      include P4

      def test_mystery_function
        assert mystery(0)
        assert mystery(1)
        assert mystery(2)
        refute mystery(3)
        assert mystery(4)
        refute mystery(5)
        refute mystery(6)
        refute mystery(7)
        assert mystery(8)
      end
    end
  end
end
