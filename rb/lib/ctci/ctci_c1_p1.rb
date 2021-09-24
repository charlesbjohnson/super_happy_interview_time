# typed: false
# frozen_string_literal: true

module CTCI
  module C1
    module P1
      # Implement an algorithm to determine if a string has all unique characters
      def unique_chars?(s)
        existing_vals = []
        ascii_vals = s.bytes
        result = true
        ascii_vals.each { |v|
          existing_vals[v] == 1 ? result = false : existing_vals[v] = 1
        }

        result
      end
    end
  end
end
