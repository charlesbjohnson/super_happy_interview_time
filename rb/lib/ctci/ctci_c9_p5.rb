# typed: true
# frozen_string_literal: true

module CTCI
  module C9
    module P5
      # Write a method to compute all permutations of a string
      def permutations(string)
        result = [""]
        buffer = []
        string.chars.each { |c|
          until result.empty?
            to_permute = result.pop
            permutations = permutations_with_character(c, to_permute)
            buffer.concat(permutations)
          end

          result.concat(buffer)
          buffer.clear
        }

        result
      end

      private

      # ('a', '') => ['a']
      # ('a', 'b') => ['ab', 'ba']
      # ('a', 'bc') => ['abc', 'bac', 'bca']
      def permutations_with_character(c, string)
        permutations = Array.new(string.size.succ) { string.chars }
        permutations.map.with_index { |p, i|
          p.insert(i, c)
          p.join
        }
      end
    end
  end
end
