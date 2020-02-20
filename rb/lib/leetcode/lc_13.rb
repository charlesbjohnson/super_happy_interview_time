# typed: false
# frozen_string_literal: true

module LeetCode
  # 13. Roman to Integer
  module LC13
    CHARS = {
      'M' => 1000,
      'D' => 500,
      'C' => 100,
      'L' => 50,
      'X' => 10,
      'V' => 5,
      'I' => 1
    }.freeze

    # Description:
    # Given a roman numeral, convert it to an integer.
    #
    # Notes:
    # - Input is guaranteed to be within the range from 1 to 3999.
    #
    # @param s {String}
    # @return {Integer}
    def roman_to_int(s)
      total = 0
      prev = 0

      s.chars.reverse_each do |c|
        v = CHARS[c]

        if v < total && v != prev
          total -= v
        else
          total += v
        end

        prev = v
      end

      total
    end
  end
end
