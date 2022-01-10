# frozen_string_literal: true

module LeetCode
  # 557. Reverse Words in a String III
  module LC557
    # Description:
    # Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
    #
    # Examples:
    # Input: s = "Let's take LeetCode contest"
    # Output: "s'teL ekat edoCteeL tsetnoc"
    #
    # Input: s = "God Ding"
    # Output: "doG gniD"
    #
    # @param {String} s
    # @return {String}
    def reverse_words(s)
      i = 0
      j = 0

      while i < s.length
        j += 1 while j + 1 < s.length && s[j + 1] != " "

        reverse(s, i, j)

        i = j + 1
        i += 1 while i < s.length && s[i] == " "

        j = i
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
