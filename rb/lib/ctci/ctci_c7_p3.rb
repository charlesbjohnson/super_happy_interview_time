# frozen_string_literal: true

# I'm tired of these motha****in' slopes on this motha****kn' Cartesian plane!
#   - Rene Descartes
module CTCI
  module C7
    module P3
      EPSILON = 0.0001

      # Given two lines on a Cartesian plane, determine whether two lines
      # would intersect.
      def intersects?(a, b)
        slopes_different = (a.slope - b.slope).abs > EPSILON
        y_intercepts_same = (a.y_int - b.y_int).abs < EPSILON

        slopes_different || y_intercepts_same
      end
    end
  end
end
