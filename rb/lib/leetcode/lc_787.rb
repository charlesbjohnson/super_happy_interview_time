# frozen_string_literal: true

module LeetCode
  # 787. Cheapest Flights Within K Stops
  module LC787
    # Description:
    # There are n cities connected by some number of flights.
    # You are given an array flights where flights[i] = [fromi, toi, pricei] indicates that there is a flight from city fromi to city toi with cost pricei.
    #
    # You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops. If there is no such route, return -1.
    #
    # Examples:
    # Input: n = 3, flights = [[0, 1, 100], [1, 2, 100], [0, 2, 500]], src = 0, dst = 2, k = 1
    # Output: 200
    #
    # Input: n = 3, flights = [[0, 1, 100], [1, 2, 100], [0, 2, 500]], src = 0, dst = 2, k = 0
    # Output: 500
    #
    # @param {Integer} n
    # @param {Array<Array<(Integer, Integer, Integer)>>} flights
    # @param {Integer} src
    # @param {Integer} dst
    # @param {Integer} k
    # @return {Integer}
    def find_cheapest_price(n, flights, src, dst, k)
      prices_prev = Array.new(n) { |i| i == src ? 0 : Float::INFINITY }
      prices_curr = prices_prev.clone

      (1...k + 2).each {
        flights.each { |from, to, price|
          prices_curr[to] = [prices_prev[from] + price, prices_curr[to]].min
        }

        prices_prev = prices_curr.clone
      }

      prices_curr[dst].infinite? ? -1 : prices_curr[dst]
    end
  end
end
