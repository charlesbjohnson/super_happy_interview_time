# frozen_string_literal: true

module LeetCode
  # 384. Shuffle an Array
  module LC384
    # Description:
    # Shuffle a set of numbers without duplicates.
    class Solution
      def initialize(list)
        @list = list
      end

      def reset
        @list
      end

      def shuffle
        shuffled = @list

        loop {
          shuffled = @list.shuffle

          break if shuffled != @list
        }

        shuffled
      end
    end
  end
end
