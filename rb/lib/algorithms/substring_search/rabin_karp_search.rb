# frozen_string_literal: true

module Algorithms
  module SubstringSearch
    module RabinKarpSearch
      class << self
        def search(string, substring)
          i = 0

          while i <= string.length - substring.length
            if string[i...(i + substring.length)].hash == substring.hash
              return i if string[i...i + substring.length] == substring
            end

            i += 1
          end

          -1
        end
      end
    end
  end
end
