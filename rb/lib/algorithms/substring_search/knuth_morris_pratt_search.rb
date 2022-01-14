# frozen_string_literal: true

module Algorithms
  module SubstringSearch
    module KnuthMorrisPrattSearch
      class << self
        def search(string, substring)
          i = 0
          j = 0

          dfa = process(substring)

          while i < string.length && j < substring.length
            c = string[i]
            i += 1
            j = dfa.dig(c, j) || 0
          end

          j >= substring.length ? i - j : -1
        end

        private

        def process(substring)
          result = substring.each_char.with_object({}) { |c, h|
            h[c] ||= Array.new(substring.length) { 0 }
          }

          back_state = 0
          curr_state = 0

          while curr_state < substring.length
            matching = substring[curr_state]

            result.each { |c, states|
              states[curr_state] = c == matching ? curr_state + 1 : states[back_state]
            }

            back_state = result[matching][back_state] if curr_state >= 1
            curr_state += 1
          end

          result
        end
      end
    end
  end
end
