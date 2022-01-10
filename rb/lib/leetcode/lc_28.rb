# frozen_string_literal: true

module LeetCode
  # 28. Implement strStr()
  module LC28
    # Description:
    # Implement strStr().
    #
    # Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
    #
    # Examples:
    # Input: haystack = "hello", needle = "ll"
    # Output: 2
    #
    # Input: haystack = "aaaaa", needle = "bba"
    # Output: -1
    #
    # Input: haystack = "", needle = ""
    # Output: 0
    #
    # @param {String} haystack
    # @param {String} needle
    # @return {Integer}
    def str_str(haystack, needle)
      idx = needle.each_char.with_index.with_object({}) { |(c, i), h| h[c] = i }

      i = 0
      j = 0

      while i <= haystack.length - needle.length
        j = needle.length - 1
        j -= 1 while j >= 0 && haystack[i + j] == needle[j]

        break if j < 0

        i += [j - idx.fetch(haystack[i + j], -1), 1].max
      end

      j >= 0 ? -1 : i
    end
  end
end
