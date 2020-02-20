# typed: false
# frozen_string_literal: true

module LeetCode
  # 322. Coin Change
  module LC322
    def coin_change_recurse(coins, amount, cache)
      return 0 if amount.zero?
      return -1 if amount.negative?
      return cache[amount] if cache[amount]

      min = Float::INFINITY

      coins.each do |coin|
        result = coin_change_recurse(coins, amount - coin, cache)
        min = result + 1 if (0...min).cover?(result)
      end

      cache[amount] = min.infinite? ? -1 : min
      cache[amount]
    end

    # Description:
    # You are given coins of different denominations and a total amount of money amount.
    # Write a function to compute the fewest number of coins that you need to make up that amount.
    # If that amount of money cannot be made up by any combination of the coins, return -1.
    #
    # Examples:
    # - 1:
    #   Input: coins = [1, 2, 5], amount = 11
    #   Output: 3
    #
    # - 2:
    #   Input: coins = [2], amount = 3
    #   Output: -1
    #
    # Notes:
    # - You may assume that you have an infinite number of each kind of coin.
    #
    # @param coins {Array<Integer>}
    # @param amount {Integer}
    # @return {Integer}
    def coin_change(coins, amount)
      coins = coins.select(&:positive?).sort.reverse

      return 0 if amount.zero?
      return -1 if coins.empty?

      coin_change_recurse(coins, amount, {})
    end
  end
end
