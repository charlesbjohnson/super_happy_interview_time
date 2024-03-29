# frozen_string_literal: true

module EPI
  module C5
    module P1
      # How would you compute the parity of a very large number of 64-bit words?
      #
      # Use a cache. Break the 64-bits into smaller (but more) chunks to keep the cache
      # small, otherwise make them larger the use a larger cache for a smaller time trade off.
      def parity(n)
        result = 0

        (0..n.bit_length).each { |i|
          result ^= n[i]
        }

        result
      end

      def split(n, chunk_width: 8)
        mask = bitmask(chunk_width)

        (0...(bits(n) / chunk_width)).reduce([]) { |a, i|
          chunk_offset = i * chunk_width
          chunk = n >> chunk_offset
          a.unshift(chunk & mask)
        }
      end

      private

      def bitmask(chunk_width)
        (1 << (1 * chunk_width)).pred
      end

      def bits(n)
        n.size * 8
      end
    end
  end
end
