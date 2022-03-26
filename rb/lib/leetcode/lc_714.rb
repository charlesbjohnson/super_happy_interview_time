# frozen_string_literal: true

module LeetCode
  # 714. Best Time to Buy and Sell Stock with Transaction Fee
  module LC714
    # Description:
    # You are given an array prices where prices[i] is the price of a given stock on the ith day, and an integer fee representing a transaction fee.
    # Find the maximum profit you can achieve. You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction.
    #
    # Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).
    #
    # Examples:
    # Input: prices = [1, 3, 2, 8, 4, 9], fee = 2
    # Output: 8
    #
    # Input: prices = [1, 3, 7, 5, 10, 3], fee = 3
    # Output: 6
    #
    # @param {Array<Integer>} prices
    # @param {Integer} fee
    # @return {Integer}
    def max_profit(prices, fee)
      result = private_methods.grep(/^max_profit_\d+$/).map { |m| send(m, prices, fee) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def max_profit_1(prices, fee)
      cache = {}

      rec = ->(i, h) {
        return 0 if i == prices.length

        cache[[i, h]] ||= if h
          [
            (prices[i] - fee) + rec.call(i + 1, false),
            rec.call(i + 1, true)
          ].max
        else
          [
            -prices[i] + rec.call(i + 1, true),
            rec.call(i + 1, false)
          ].max
        end
      }

      rec.call(0, false)
    end

    def max_profit_2(prices, fee)
      cache = Array.new(prices.length + 1) { Array.new(2, 0) }

      (prices.length - 1).downto(0) { |i|
        (0..1).each { |h|
          cache[i][h] = if h == 1
            [
              (prices[i] - fee) + cache[i + 1][0],
              cache[i + 1][1]
            ].max
          else
            [
              -prices[i] + cache[i + 1][1],
              cache[i + 1][0]
            ].max
          end
        }
      }

      cache[0][0]
    end
  end
end
