# typed: false
# frozen_string_literal: true

module LeetCode
  # 8. String to Integer (atoi)
  module LC8
    MAX = ((2**32) / 2) - 1
    MIN = -(MAX + 1)

    def to_code(char)
      char.ord - '0'.ord
    end

    # Description:
    # Implement atoi to convert a string to an integer.
    #
    # Notes:
    # - The function first discards as many whitespace characters as necessary until the first non-whitespace character is found.
    #   Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
    #
    # - The string can contain additional characters after those that form the integral number,
    #   which are ignored and have no effect on the behavior of this function.
    #
    # - If the first sequence of non-whitespace characters in str is not a valid integral number,
    #   or if no such sequence exists because either str is empty or it contains only whitespace characters,
    #   no conversion is performed.
    #
    # - If no valid conversion could be performed, a zero value is returned.
    #   If the correct value is out of the range of representable values,
    #   INT_MAX (2147483647) or INT_MIN (-2147483648) is returned.
    #
    # @param s {String}
    # @return {Integer}
    def my_atoi(s)
      s = s.strip

      return 0 if s.empty?

      start = s[0].match?(/[+-]/) ? 1 : 0
      is_negative = s[0] == '-'
      s = s[start..-1]

      non_digit = s =~ /[^\d]/
      s = s[0...non_digit] if non_digit

      result = (0...s.length).reverse_each.reduce(0) do |res, i|
        power = 10**(s.length - 1 - i)
        digit = to_code(s[i])
        res + (digit * power)
      end

      result *= -1 if is_negative

      return MIN if result < MIN
      return MAX if result > MAX

      result
    end
  end
end
