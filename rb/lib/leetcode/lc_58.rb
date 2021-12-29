# frozen_string_literal: true

module LeetCode
  # 58. Length of Last Word
  module LC58
    # Description:
    # Given a string s consisting of some words separated by some number of spaces,
    # return the length of the last word in the string.
    #
    # A word is a maximal substring consisting of non-space characters only.
    #
    # Examples:
    # Input: s = "Hello World"
    # Output: 5
    #
    # Input: s = "   fly me   to   the moon  "
    # Output: 4
    # Explanation: The last word is "moon" with length 4.
    #
    # Input: s = "luffy is still joyboy"
    # Output: 6
    # Explanation: The last word is "joyboy" with length 6.
    #
    # @param {String} s
    # @return {Integer}
    def length_of_last_word(s)
      s.split(" ").last.length
    end
  end
end
