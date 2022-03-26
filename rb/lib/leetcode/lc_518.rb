# frozen_string_literal: true

module LeetCode
  # 518. Coin Change 2
  module LC518
    # Description:
    # You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
    #
    # Return the number of combinations that make up that amount.
    # If that amount of money cannot be made up by any combination of the coins, return 0.
    #
    # You may assume that you have an infinite number of each kind of coin.
    # The answer is guaranteed to fit into a signed 32-bit integer.
    #
    # Examples:
    # Input: amount = 5, coins = [1, 2, 5]
    # Output: 4
    #
    # Input: amount = 3, coins = [2]
    # Output: 0
    #
    # Input: amount = 10, coins = [10]
    # Output: 1
    #
    # @param {Integer} amount
    # @param {Array<Integer>} coins
    # @return {Integer}
    def change(amount, coins)
      result = private_methods.grep(/^change_\d+$/).map { |m| send(m, amount, coins) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def change_1(amount, coins)
      coins.sort!

      cache = {}

      rec = ->(a, i) {
        return 1 if a == 0
        return 0 if i == coins.length || a < coins[i]

        cache[[a, i]] ||= rec.call(a - coins[i], i) + rec.call(a, i + 1)
      }

      rec.call(amount, 0)
    end

    def change_2(amount, coins)
      coins.sort!

      cache = Array.new(amount + 1) { Array.new(coins.length + 1, 0) }
      (0...coins.length).each { |i| cache[0][i] = 1 }

      (1..amount).each { |a|
        (coins.length - 1).downto(0) { |i|
          cache[a][i] += cache[a - coins[i]][i] + cache[a][i + 1] if a >= coins[i]
        }
      }

      cache[amount][0]
    end
  end
end
