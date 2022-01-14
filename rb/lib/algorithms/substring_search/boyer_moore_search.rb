# frozen_string_literal: true

module Algorithms
  module SubstringSearch
    module BoyerMooreSearch
      class << self
        def search(string, substring)
          idx = process(substring)

          i = 0
          j = 0

          while i <= string.length - substring.length
            j = substring.length - 1
            j -= 1 while j >= 0 && string[i + j] == substring[j]

            break if j < 0

            i += [j - idx.fetch(string[i + j], -1), 1].max
          end

          j >= 0 ? -1 : i
        end

        private

        def process(substring)
          substring.each_char.with_index.with_object({}) { |(c, i), h|
            h[c] = i
          }
        end
      end
    end
  end
end
