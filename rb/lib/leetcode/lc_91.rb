# frozen_string_literal: true

module LeetCode
  # 91. Decode Ways
  module LC91
    # Description:
    # A message containing letters from A-Z can be encoded into numbers using the following mapping:
    #
    #   'A' -> "1"
    #   'B' -> "2"
    #   ...
    #   'Z' -> "26"
    #
    # To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways).
    # For example, "11106" can be mapped into:
    #
    # - "AAJF" with the grouping (1 1 10 6)
    # - "KJF" with the grouping (11 10 6)
    #
    # Note that the grouping (1 11 06) is invalid because "06" cannot be mapped into 'F' since "6" is different from "06".
    #
    # Given a string s containing only digits, return the number of ways to decode it.
    #
    # Examples:
    # Input: s = "12"
    # Output: 2
    #
    # Input: s = "226"
    # Output: 3
    #
    # Input: s = "06"
    # Output: 0
    #
    # @param {String} s
    # @return {Integer}
    def num_decodings(s)
      result = private_methods.grep(/^num_decodings_\d+$/).map { |m| send(m, s) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def num_decodings_1(s)
      cache = {}

      rec = ->(i) {
        return 1 if i == s.length
        return 0 if s[i] == "0"
        return 1 if i == s.length - 1

        cache[i] ||= rec.call(i + 1) + (s[i...(i + 2)].to_i <= 26 ? rec.call(i + 2) : 0)
      }

      rec.call(0)
    end

    def num_decodings_2(s)
      cache = Array.new(s.length + 1, 0)

      cache[s.length] = 1
      cache[s.length - 1] = 1 if s[-1] != "0"

      (s.length - 2).downto(0) { |i|
        cache[i] = cache[i + 1] + (s[i...(i + 2)].to_i <= 26 ? cache[i + 2] : 0) if s[i] != "0"
      }

      cache[0]
    end
  end
end
