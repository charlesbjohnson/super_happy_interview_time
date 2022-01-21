# frozen_string_literal: true

module LeetCode
  # 374. Guess Number Higher or Lower
  module LC374
    # Description:
    # We are playing the Guess Game. The game is as follows:
    #
    # I pick a number from 1 to n. You have to guess which number I picked.
    # Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.
    #
    # You call a pre-defined API int guess(int num), which returns 3 possible results:
    # - -1: The number I picked is lower than your guess (i.e. pick < num).
    # -  1: The number I picked is higher than your guess (i.e. pick > num).
    # -  0: The number I picked is equal to your guess (i.e. pick == num).
    #
    # Return the number that I picked.
    #
    # Examples:
    # Input: n = 10, pick = 6
    # Output: 6
    #
    # Input: n = 1, pick = 1
    # Output: 1
    #
    # Input: n = 2, pick = 1
    # Output: 1
    #
    # @param {Integer} n
    # @return {Integer}
    def guess_number(n)
      lo = 1
      hi = n

      while lo <= hi
        mid = ((hi - lo) / 2) + lo
        outcome = guess(mid)

        if outcome == 0
          return mid
        end

        if outcome == -1
          hi = mid - 1
        else
          lo = mid + 1
        end
      end

      raise
    end
  end
end
