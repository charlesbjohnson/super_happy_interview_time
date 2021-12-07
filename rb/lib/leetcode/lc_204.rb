# frozen_string_literal: true

module LeetCode
  # 204. Count Primes
  module LC204
    # Description:
    # Count the number of prime numbers less than a non-negative number, n.
    #
    # @param n {Integer}
    # @return {Integer}
    def count_primes(n)
      return 0 if n < 2

      primes = Array.new(n) { |v| v }

      primes[0] = nil
      primes[1] = nil

      (2...(primes.length / 2.0).ceil).each { |v|
        next unless primes[v]

        next_divisible = v
        while (next_divisible + v) < primes.length
          next_divisible += v
          primes[next_divisible] = nil
        end
      }

      primes.each.reduce(0) { |a, v| v ? a + 1 : a }
    end
  end
end
