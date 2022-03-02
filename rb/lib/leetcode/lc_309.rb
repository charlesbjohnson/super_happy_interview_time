# frozen_string_literal: true

module LeetCode
  # 309. Best Time to Buy and Sell Stock with Cooldown
  module LC309
    # Description:
    # You are given an array prices where prices[i] is the price of a given stock on the ith day.
    # Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times) with the following restrictions:
    # - After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).
    #
    # Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).
    #
    # Examples:
    # Input: prices = [1, 2, 3, 0, 2]
    # Output: 3
    #
    # Input: prices = [1]
    # Output: 0
    #
    # @param {Array<Integer>} prices
    # @return {Integer}
    def max_profit(prices)
      result = private_methods.grep(/^max_profit_\d+$/).map { |m| send(m, prices) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def max_profit_1(prices)
      cache = {}

      rec = ->(i, c, h) {
        return 0 if i == prices.length

        cache[[i, c, h]] ||= if c
          rec.call(i + 1, false, false)
        elsif h
          [
            prices[i] + rec.call(i + 1, true, false),
            rec.call(i + 1, false, true)
          ].max
        else
          [
            -prices[i] + rec.call(i + 1, false, true),
            rec.call(i + 1, false, false)
          ].max
        end
      }

      rec.call(0, false, false)
    end

    def max_profit_2(prices)
      result = Array.new(prices.length + 1) { Array.new(2) { Array.new(2, 0) } }

      (prices.length - 1).downto(0) { |i|
        (0..1).each { |c|
          (0..1).each { |h|
            if c == 1 && h == 1
              next
            elsif c == 1
              result[i][c][h] = result[i + 1][0][0]
            elsif h == 1
              result[i][c][h] = [
                prices[i] + result[i + 1][1][0],
                result[i + 1][0][1]
              ].max
            else
              result[i][c][h] = [
                -prices[i] + result[i + 1][0][1],
                result[i + 1][0][0]
              ].max
            end
          }
        }
      }

      result[0][0][0]
    end
  end
end
