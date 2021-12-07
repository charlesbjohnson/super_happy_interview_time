# frozen_string_literal: true

module LeetCode
  # 728. Self Dividing Numbers
  module LC728
    # Description:
    # A self-dividing number is a number that is divisible by every digit it contains.
    # For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
    # Also, a self-dividing number is not allowed to contain the digit zero.
    # Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.
    #
    # Examples:
    # Input: left = 1, right = 22
    # Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
    #
    # Notes:
    # - The boundaries of each input argument are 1 <= left <= right <= 10000.
    #
    # @param left {Integer}
    # @param right {Integer}
    # @return {Array<Integer>}
    def self_dividing_numbers(left, right)
      (left..right).reject { |i| i.to_s.include?("0") }
        .select { |i| i.to_s.chars.all? { |c| (i % c.to_i).zero? } }
    end
  end
end
