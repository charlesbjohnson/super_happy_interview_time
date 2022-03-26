# frozen_string_literal: true

module LeetCode
  # 309. Best Time to Buy and Sell Stock with Cooldown
  module LC309
    # Description:
    # You are given an array prices where prices[i] is the price of a given stock on the ith day.
    #
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

      rec = ->(i, h) {
        return 0 if i >= prices.length

        cache[[i, h]] ||= if h
          [
            prices[i] + rec.call(i + 2, false),
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

    def max_profit_2(prices)
      cache = {}

      rec = ->(i, state) {
        return 0 if i == prices.length

        cache[[i, state]] ||= case state
        when :buy
          [
            -prices[i] + rec.call(i + 1, :sell),
            rec.call(i + 1, :buy)
          ].max
        when :sell
          [
            prices[i] + rec.call(i + 1, :cooldown),
            rec.call(i + 1, :sell)
          ].max
        when :cooldown
          rec.call(i + 1, :buy)
        end
      }

      rec.call(0, :buy)
    end

    def max_profit_3(prices)
      cache = Array.new(prices.length + 2) { Array.new(2, 0) }

      (prices.length - 1).downto(0) { |i|
        (0..1).each { |h|
          cache[i][h] = if h == 1
            [
              prices[i] + cache[i + 2][0],
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

    def max_profit_4(prices)
      cache = Array.new(prices.length + 1) { Hash.new(0) }
      states = [:buy, :sell, :cooldown]

      (prices.length - 1).downto(0) { |i|
        states.each { |state|
          cache[i][state] = case state
          when :buy
            [
              -prices[i] + cache[i + 1][:sell],
              cache[i + 1][:buy]
            ].max
          when :sell
            [
              prices[i] + cache[i + 1][:cooldown],
              cache[i + 1][:sell]
            ].max
          when :cooldown
            cache[i + 1][:buy]
          end
        }
      }

      cache[0][:buy]
    end

    def max_profit_5(prices)
      buy = 0
      sell = 0
      cooldown = 0

      (prices.length - 1).downto(0) { |i|
        buy, p_buy = [-prices[i] + sell, buy].max, buy
        sell = [prices[i] + cooldown, sell].max
        cooldown = p_buy
      }

      buy
    end
  end
end
