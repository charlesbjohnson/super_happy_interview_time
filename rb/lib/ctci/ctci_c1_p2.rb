# typed: true
# frozen_string_literal: true

module CTCI
  module C1
    module P2
      # Implement a function which reverses a string
      def reverse(s)
        lo = 0
        hi = s.length.pred
        result = s.dup

        while lo < hi
          tmp = result[lo]
          result[lo] = result[hi]
          result[hi] = tmp

          lo = lo.succ
          hi = hi.pred
        end

        result
      end
    end
  end
end
