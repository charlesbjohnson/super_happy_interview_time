# frozen_string_literal: true

module EPI
  module C5
    module P2
      # Implement code that takes a 64-bit integer and swaps the bits in that integer at indices `i` and `j`.
      def swap_bits(n, i, j)
        return n if n[i] == n[j]

        n ^ ((1 << i) | (1 << j))
      end
    end
  end
end
