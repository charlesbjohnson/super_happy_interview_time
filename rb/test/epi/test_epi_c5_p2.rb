# frozen_string_literal: true

require("config")
require("epi/epi_c5_p2")

module EPI
  module C5
    class TestP2 < Minitest::Test
      include(P2)

      [
        [0b0001, 0, 3, 0b1000],
        [0b1000, 3, 0, 0b0001],
        [0b0101, 0, 1, 0b0110],
        [0b0000, 0, 3, 0b0000],
        [0b1001, 0, 3, 0b1001]
      ].each.with_index { |(n, bit_i, bit_j, expected), i|
        define_method(:"test_swap_bits_#{i}") {
          assert_equal(expected, swap_bits(n, bit_i, bit_j))
        }
      }
    end
  end
end
