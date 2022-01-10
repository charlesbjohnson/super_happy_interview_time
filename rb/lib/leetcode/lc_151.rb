# frozen_string_literal: true

module LeetCode
  # 151. Reverse Words in a String
  module LC151
    # Description:
    # Given an input string s, reverse the order of the words.
    # A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
    #
    # Return a string of the words in reverse order concatenated by a single space.
    # Note that s may contain leading or trailing spaces or multiple spaces between two words.
    # The returned string should only have a single space separating the words. Do not include any extra spaces.
    #
    # Examples:
    # Input: s = "the sky is blue"
    # Output: "blue is sky the"
    #
    # Input: s = "  hello world  "
    # Output: "world hello"
    #
    # Input: s = "a good   example"
    # Output: "example good a"
    #
    # @param {String} s
    # @return {String}
    def reverse_words(s)
      s.strip!
      s.squeeze!(" ")

      reverse(s, 0, s.length - 1)

      i = 0
      j = 0

      while i < s.length
        i += 1 while i < s.length && s[i] == " "

        j = i
        j += 1 while j + 1 < s.length && s[j + 1] != " "

        reverse(s, i, j)

        i = j + 1
      end

      s
    end

    def reverse(s, i, j)
      while i < j
        s[i], s[j] = s[j], s[i]
        i += 1
        j -= 1
      end
    end
  end
end
