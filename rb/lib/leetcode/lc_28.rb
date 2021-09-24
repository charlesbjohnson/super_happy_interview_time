# typed: true
# frozen_string_literal: true

module LeetCode
  # 28. Implement strStr()
  module LC28
    # Description:
    # Implement strStr().
    # Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
    #
    # Examples:
    # - 1:
    #   Input: haystack = "hello", needle = "ll"
    #   Output: 2
    #
    # - 2:
    #   Input: haystack = "aaaaa", needle = "bba"
    #   Output: -1
    #
    # @param haystack {String}
    # @param needle {String}
    # @return {Integer}
    def str_str(haystack, needle)
      return 0 if needle.empty?
      return -1 if haystack.length < needle.length

      (0..(haystack.length - needle.length)).each { |h|
        (0...needle.length).each { |n|
          break if haystack[h + n] != needle[n]
          return h if n == needle.length - 1
        }
      }

      -1
    end
  end
end
