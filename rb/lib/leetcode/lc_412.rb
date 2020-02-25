# typed: true
# frozen_string_literal: true

module LeetCode
  # 412. Fizz Buzz
  module LC412
    # Description:
    # Write a program that outputs the string representation of numbers from 1 to n.
    # But for multiples of three it should output "Fizz" instead of the number and for the multiples of five output "Buzz".
    # For numbers which are multiples of both three and five output "FizzBuzz".
    #
    # Examples:
    # Input: 15
    # Output: [
    #   "1",
    #   "2",
    #   "Fizz",
    #   "4",
    #   "Buzz",
    #   "Fizz",
    #   "7",
    #   "8",
    #   "Fizz",
    #   "Buzz",
    #   "11",
    #   "Fizz",
    #   "13",
    #   "14",
    #   "FizzBuzz"
    # ]
    #
    # @param n {Integer}
    # @return {Array<String>}
    def fizz_buzz(n)
      Array.new(n) do |i|
        i += 1

        s = ""

        s += "Fizz" if (i % 3).zero?
        s += "Buzz" if (i % 5).zero?
        s += i.to_s if s.empty?

        s
      end
    end
  end
end
