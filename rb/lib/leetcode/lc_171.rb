# frozen_string_literal: true

module LeetCode
  # 171. Excel Sheet Column Number
  module LC171
    def to_code(s)
      (s.ord - "A".ord) + 1
    end

    # Description:
    # Given a column title as appear in an Excel sheet, return its corresponding column number.
    #
    # Examples:
    #   - 1:
    #     Input: "A"
    #     Output: 1
    #
    #   - 2:
    #     Input: "B"
    #     Output: 2
    #
    #   - 3:
    #     Input: "C"
    #     Output: 3
    #
    #   - 4:
    #     Input: "Z"
    #     Output: 26
    #
    #   - 5:
    #     Input: "AA"
    #     Output: 27
    #
    #   - 6:
    #     Input: "AB"
    #     Output: 28
    #
    # @param s {String}
    # @return {Integer}
    def title_to_number(s)
      s.chars.reverse_each.with_index.reduce(0) { |total, (char, i)|
        total + (to_code(char) * 26**i)
      }
    end
  end
end
