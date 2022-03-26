# frozen_string_literal: true

module LeetCode
  # 322. Coin Change
  module LC322
    # Description:
    # You are given an integer array coins representing coins of different denominations
    # and an integer amount representing a total amount of money.
    #
    # Return the fewest number of coins that you need to make up that amount.
    # If that amount of money cannot be made up by any combination of the coins, return -1.
    #
    # You may assume that you have an infinite number of each kind of coin.
    #
    # Examples:
    # Input: coins = [1, 2, 5], amount = 11
    # Output: 3
    #
    # Input: coins = [2], amount = 3
    # Output: -1
    #
    # Input: coins = [1], amount = 0
    # Output: 0
    #
    # @param {Array<Integer>} coins
    # @param {Integer} amount
    # @return {Integer}
    def coin_change(coins, amount)
      result = private_methods.grep(/^coin_change_\d+$/).map { |m| send(m, coins, amount) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def coin_change_1(coins, amount)
      cache = {}

      rec = ->(total) {
        return 0 if total == amount

        cache[total] ||= (0...coins.length).map { |i|
          total + coins[i] <= amount ? 1 + rec.call(total + coins[i]) : Float::INFINITY
        }.min
      }

      result = rec.call(0)
      result.infinite? ? -1 : result
    end

    def coin_change_2(coins, amount)
      cache = Array.new(amount + 1) { |total| total == amount ? 0 : Float::INFINITY }

      (amount - 1).downto(0) { |total|
        cache[total] = (0...coins.length).map { |i|
          total + coins[i] <= amount ? 1 + cache[total + coins[i]] : Float::INFINITY
        }.min
      }

      result = cache[0]
      result.infinite? ? -1 : result
    end
  end
end
