# frozen_string_literal: true

module LeetCode
  # 6. Zigzag Conversion
  module LC6
    # Description:
    # The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this:
    # P   A   H   N
    # A P L S I I G
    # Y   I   R
    #
    # And then read line by line: "PAHNAPLSIIGYIR"
    #
    # Write the code that will take a string and make this conversion given a number of rows:
    #
    # Examples:
    # Input: s = "PAYPALISHIRING", num_rows = 3
    # Output: "PAHNAPLSIIGYIR"
    #
    # Input: s = "PAYPALISHIRING", num_rows = 4
    # Output: "PINALSIGYAHRPI"
    # Explanation:
    # P     I    N
    # A   L S  I G
    # Y A   H R
    # P     I
    #
    # Input: s = "A", num_rows = 1
    # Output: "A"
    #
    # @param {String} s
    # @param {Integer} num_rows
    # @return {String}
    def convert(s, num_rows)
      return s if num_rows <= 1

      result = ""
      distance = (num_rows * 2) - 2

      num_rows.times { |row|
        down_distance = distance - (row * 2)
        up_distance = distance - down_distance

        col = row
        dir = :down

        while col < s.length
          result += s[col]

          if row == 0 || row == num_rows - 1
            col += distance
            next
          end

          col += dir == :down ? down_distance : up_distance
          dir = dir == :down ? :up : :down
        end
      }

      result
    end
  end
end
