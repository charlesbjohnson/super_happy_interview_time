# frozen_string_literal: true

module LeetCode
  # 424. Longest Repeating Character Replacement
  module LC424
    # Description:
    # You are given a string s and an integer k.
    # You can choose any character of the string and change it to any other uppercase English character.
    # You can perform this operation at most k times.
    #
    # Return the length of the longest substring containing the same letter you can get after performing the above operations.
    #
    # Examples:
    # Input: s = "ABAB", k = 2
    # Output: 4
    #
    # Input: s = "AABABBA", k = 1
    # Output: 4
    #
    # @param {String} s
    # @param {Integer} k
    # @return {Integer}
    def character_replacement(s, k)
      result = private_methods.grep(/^character_replacement_\d+$/).map { |m| send(m, s, k) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def character_replacement_1(s, k)
      result = 1

      i = 0
      j = 1

      letters = Hash.new(0)
      letters[s[i]] += 1

      max_letter = 1

      while j < s.length
        if (j - i) - max_letter > k
          letters[s[i]] -= 1
          i += 1
        else
          letters[s[j]] += 1
          max_letter = [max_letter, letters[s[j]]].max
          j += 1
        end

        result = [result, j - i].max if (j - i) - max_letter <= k
      end

      result
    end

    def character_replacement_2(s, k)
      result = 0

      i = 0
      j = 0

      letters = Hash.new(0)
      max_letter = 0

      while j < s.length
        letters[s[j]] += 1
        max_letter = [max_letter, letters[s[j]]].max
        j += 1

        while (j - i) - max_letter > k
          letters[s[i]] -= 1
          i += 1
        end

        result = [result, j - i].max
      end

      result
    end
  end
end
