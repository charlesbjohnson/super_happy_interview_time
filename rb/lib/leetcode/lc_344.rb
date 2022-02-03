# frozen_string_literal: true

module LeetCode
  # 344. Reverse String
  module LC344
    # Description:
    # Write a function that reverses a string. The input string is given as an array of characters s.
    #
    # You must do this by modifying the input array in-place with O(1) extra memory.
    #
    # Examples:
    # Input: s = ["h", "e", "l", "l", "o"]
    # Output: ["o", "l", "l", "e", "h"]
    #
    # Input: s = ["H", "a", "n", "n", "a", "h"]
    # Output: ["h", "a", "n", "n", "a", "H"]
    #
    # @param {Array<String>} s
    # @return {nil}
    def reverse_string(s)
      (0...(s.length / 2)).each { |i|
        s[i], s[s.length - 1 - i] = s[s.length - 1 - i], s[i]
      }

      nil
    end
  end
end
