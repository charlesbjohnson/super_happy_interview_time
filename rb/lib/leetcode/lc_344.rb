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
      i = 0
      j = s.length - 1

      while i < j
        s[i], s[j] = s[j], s[i]
        i += 1
        j -= 1
      end

      nil
    end
  end
end
