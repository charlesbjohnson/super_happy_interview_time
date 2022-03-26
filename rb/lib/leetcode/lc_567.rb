# frozen_string_literal: true

module LeetCode
  # 567. Permutation in String
  module LC567
    # Description:
    # Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
    #
    # In other words, return true if one of s1's permutations is the substring of s2.
    #
    # Examples:
    # Input: s1 = "ab", s2 = "eidbaooo"
    # Output: true
    #
    # Input: s1 = "ab", s2 = "eidboaoo"
    # Output: false
    #
    # @param {String} s1
    # @param {String} s2
    # @return {Boolean}
    def check_inclusion(s1, s2)
      result = private_methods.grep(/^check_inclusion_\d+$/).map { |m| send(m, s1, s2) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def check_inclusion_1(s1, s2)
      i = 0
      j = 0

      letters = s1.each_char.with_object(Hash.new(0)) { |c, h| h[c] += 1 }

      while j < s2.length
        if letters.key?(s2[j]) && letters[s2[j]] > 0
          letters[s2[j]] -= 1
          j += 1
        else
          letters[s2[i]] += 1 if letters.key?(s2[i])
          i += 1
          j = [i, j].max
        end

        return true if (j - i) == s1.length
      end

      false
    end

    def check_inclusion_2(s1, s2)
      i = 0
      j = 0

      letters = s1.each_char.with_object(Hash.new(0)) { |c, h| h[c] += 1 }

      while j < s2.length
        while j < s2.length && (!letters.key?(s2[i]) || !letters.key?(s2[j]) || letters[s2[j]] == 0)
          letters[s2[i]] += 1 if letters.key?(s2[i])
          i += 1
          j = [i, j].max
        end

        return false if j >= s2.length

        letters[s2[j]] -= 1 if letters.key?(s2[j])
        j += 1

        return true if (j - i) == s1.length
      end

      false
    end
  end
end
