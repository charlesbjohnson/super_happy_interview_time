# frozen_string_literal: true

module CTCI
  module C9
    module P4
      # Write a method to return all subsets of a set.
      def subsets_of_set(set)
        set.reduce([[]]) { |result, i|
          result.concat(result.map { |s| s.clone.push(i) })
        }
      end
    end
  end
end
